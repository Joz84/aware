class GameSkillsController < ApplicationController
  def update
    @game_skill = GameSkill.find(params[:id])
    if @game_skill.update(rating_params)
      redirect_to mentorings_path
    else
      @mentorings = current_user.mentor_game_skills
      render 'pages/mentorings'
    end
  end

  def rating_params
    params.require(:game_skill).permit(:rating)
  end

end
