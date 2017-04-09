class GamesController < ApplicationController
  def create
    @challenge = Challenge.find_by(title: params["commit"])
    @game = Game.create(  user: current_user, challenge: @challenge )
    @challenge.skills.each do |skill|

      mentor = User.joins(:game_skills)
                   .where(game_skills: { skill: skill, rating: 10 })
                   .select{ |u| u != current_user }
                   .first
      GameSkill.create( game: @game,
                        skill: skill,
                        mentor: mentor,
                        rating: 0
                      )
    end
    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    constraint = Constraint.find_by(title: params["commit"])
    @game.update(constraint: constraint)
    redirect_to @game
  end
end
