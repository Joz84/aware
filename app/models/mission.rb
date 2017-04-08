class Mission < ApplicationRecord
  has_many :challenges
  validates :title, presence: true

end
