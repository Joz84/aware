class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    if params["commit"] == "Mes missions inachenées"
      if current_user
        @challenges = current_user.unfinished_challenges.sample(3)
      else
        redirect_to new_user_session_path
      end
    elsif params["commit"] == "M'inspirer"
      @challenges = Challenge.all.sample(3)
    else
      @challenges = Challenge.pgsearch(challenges_params[:words]).sample(3)
    end
  end

  private

  def challenges_params
    params.require(:selected_challenges).permit(:words)
  end

end
