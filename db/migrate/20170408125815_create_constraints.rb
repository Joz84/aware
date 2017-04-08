class CreateConstraints < ActiveRecord::Migration[5.0]
  def change
    create_table :constraints do |t|
      t.references :challenge, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
