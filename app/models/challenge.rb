class Challenge < ApplicationRecord
  belongs_to :mission
  has_many :challenge_skills
  has_many :skills, through: :challenge_skills
  has_many :games
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true
  validates :technician, presence: true
end
