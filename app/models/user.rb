class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_attachment :photo

  has_many :mentor_game_skills, foreign_key: :mentor_id, class_name: "GameSkill"
  has_many :games
  has_many :game_skills, through: :games
  has_many :skills, through: :game_skills
  has_many :messages
  belongs_to :specialty, class_name: "Skill"
  # validates :first_name, presence: true
  # validates :pseudo, presence: true
  # validates :pseudo, uniqueness: true


  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:gender] = auth.extra.raw_info.gender
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def unfinished_challenges
    games
    .select { |game| !game.done? }
    .map(&:challenge)
  end

  def potential_mentors(skill)
    User.where.not(id: self.id)
        .joins(:game_skills)
        .where(game_skills: { skill: skill })
        .where.not(game_skills: { rating: nil })
        .select { |user| user.mentor?(skill) }
  end

  def validated_skills
    Skill.joins(:game_skills)
         .where.not(game_skills: {rating: nil})
         .joins(:games)
         .where(games: {user: u})
         .uniq
  end


  def ratings(skill)
    GameSkill.where(skill: skill)
             .where.not(rating: nil)
             .joins(:game)
             .where(games: {user: self})
             .map(&:rating)
  end

  def number_actions_with(skill)
    ratings(skill).size
  end

  def average(skill)
    ratings = ratings(skill)
    ratings.size >= 3 ? (ratings.reduce(:+).to_f / ratings.size).round(2) : false
  end

  def mentor?(skill)
    average = average(skill)
    (average && average >= 8) ? average : false
  end

  def experts(skill)
    User.where(specialty: skill)
  end

end
