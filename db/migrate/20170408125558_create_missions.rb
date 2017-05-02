class CreateMissions < ActiveRecord::Migration[5.0]
  def change
    create_table :missions do |t|
      t.string :title
      t.boolean :visible
      t.text :decription

      t.timestamps
    end
  end
end
