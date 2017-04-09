class ChallengesController < ApplicationController
  def index
    if params["commit"]
      @mission = Mission.joins(:skills)
                        .where(skills: { title: params["commit"] })
                        .joins(:challenges)
                        .where({challenges: { category: session["category"] }})
                        .sample
      @title = @mission.title
      @challenges = Challenge.where(mission: @mission, category: session["category"] )
    else
      @title = "Résultats de ta recherche"
      @challenges = Challenge.pgsearch(skill_params[:words])
    end
  end

  private

  def skill_params
    params.require(:selected_skill).permit(:words)
  end

end
