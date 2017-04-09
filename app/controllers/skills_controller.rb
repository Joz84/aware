class SkillsController < ApplicationController
  def index
    session["category"] = params["commit"]
    @skills = Skill.joins(:challenges)
                   .where({challenges: { category: session["category"] }})
                   .uniq
                   .shuffle[0..3]
    raise
  end

end
