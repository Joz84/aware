class SkillsController < ApplicationController
  def index
    session["category"] = params["commit"]
    @skills = Skill.joins(:categories)
                   .where({categories: { title: session["category"] }})
                   .uniq
                   .shuffle[0..3]
  end
end
