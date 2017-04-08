class GameSkill < ApplicationRecord
  belongs_to :game
  belongs_to :skill
end
