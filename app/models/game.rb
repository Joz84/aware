class Game < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  belongs_to :constraint
  has_many :game_skills
  has_many :skills, through: :game_skills
end
