class Constraint < ApplicationRecord
  belongs_to :challenge
  has_many :games
end
