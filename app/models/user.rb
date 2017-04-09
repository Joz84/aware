class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attachment :photo

  has_many :mentor_game_skills, foreign_key: :mentor_id, class_name: "GameSkill"
  has_many :games
  has_many :game_skills, through: :games
  has_many :skills, through: :game_skills
  validates :pseudo, presence: true
  validates :pseudo, uniqueness: true


  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
