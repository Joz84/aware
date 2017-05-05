class Skill < ApplicationRecord
  has_many :game_skills
  has_many :games, through: :game_skills
  has_many :challenge_skills
  has_many :challenges, through: :challenge_skills
  has_many :categories, through: :challenges
  has_many :users
  has_many :experts, foreign_key: :specialty_id, class_name: "User"
  validates :title, presence: true
end
