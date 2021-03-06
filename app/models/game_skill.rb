class GameSkill < ApplicationRecord
  belongs_to :game
  belongs_to :skill
  belongs_to :mentor, class_name: "User"
  has_one :user, through: :game
  has_one :challenge, through: :game
  has_many :messages
end
