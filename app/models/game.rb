class Game < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :game_skills
  has_many :skills, through: :game_skills
end
