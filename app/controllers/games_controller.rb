class GamesController < ApplicationController
  def create
    @challenge = Challenge.find_by(title: params["commit"])
    @game = Game.find_by(  user: current_user, challenge: @challenge )
    unless @game
      @game = Game.create(  user: current_user, challenge: @challenge )
      @challenge.skills.each do |skill|
        mentors = current_user.potential_mentors(skill)
        mentor = mentors ? mentors.sample : skill.experts.sample
        GameSkill.create( game: @game, skill: skill, mentor: mentor )
      end
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

  def index
    @games = current_user.games
  end
end
