class Skill < ApplicationRecord
  has_many :game_skills
  has_many :challenge_skills
  validates :title, presence: true
end
