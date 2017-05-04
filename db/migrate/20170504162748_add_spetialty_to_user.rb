class AddSpetialtyToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :specialty
  end
end
