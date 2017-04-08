class ChallengeSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :challenge
end
