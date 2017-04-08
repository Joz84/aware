class CreateGameSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :game_skills do |t|
      t.references :game, foreign_key: true
      t.references :skill, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.integer :rating

      t.timestamps
    end
  end
end
