class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def mentorings
    @mentorings = current_user.mentor_game_skills
  end

end
