class SkillsController < ApplicationController
  def index
    @skills = Skill.joins(:challenges)
                   .where({challenges: { category: params["commit"] }})
                   .uniq
                   .shuffle[0..3]

  end

end
