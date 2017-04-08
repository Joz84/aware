class CreateChallengeSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :challenge_skills do |t|
      t.references :skill, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
