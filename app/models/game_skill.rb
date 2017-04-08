class GameSkill < ApplicationRecord
  belongs_to :game
  belongs_to :skill
  belongs_to :mentor, class_name: "User"
end
