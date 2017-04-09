class Mission < ApplicationRecord
  has_many :challenges
  has_many :challenge_skills, through: :challenges
  has_many :skills, through: :challenge_skills
  validates :title, presence: true

end
