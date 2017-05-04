class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.references :category, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :visible

      t.timestamps
    end
  end
end
