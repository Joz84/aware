class Challenge < ApplicationRecord
  belongs_to :category
  has_many :challenge_skills
  has_many :skills, through: :challenge_skills
  has_many :games
  has_many :constraints
  validates :title, presence: true
  validates :title, uniqueness: true
  # validates :description, presence: true

  include PgSearch
  pg_search_scope :pgsearch,
    against: [:title, :description],
    associated_against: { skills: [:title, :description] },
    using: {  tsearch: { prefix: true, any_word: true },
              dmetaphone: { any_word: true, sort_only: true },
              trigram: { threshold: 0.3 }
            },
    ignoring: :accents


end
