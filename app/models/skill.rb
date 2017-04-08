class Skill < ApplicationRecord
  has_many :game_skills
  has_many :challenge_skills
  has_many :challenges, through: :challenge_skills
  validates :title, presence: true
end
