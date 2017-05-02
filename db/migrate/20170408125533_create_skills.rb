class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :title
      t.text :decription
      t.boolean :labeled

      t.timestamps
    end
  end
end
