class Game < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  belongs_to :constraint
  has_many :game_skills
  has_many :skills, through: :game_skills

  def done?
    game_skills.map{|gs| !gs.rating.nil? }.reduce(:&)
  end

  def average
    (game_skills.select( &:rating ).map(&:rating).sum.to_f / game_skills.size).round(2)
  end
end
