class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.references :mission, foreign_key: true
      t.references :category, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
