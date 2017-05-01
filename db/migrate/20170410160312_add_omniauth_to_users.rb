class AddOmniauthToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :facebook_picture_url, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :datetime
    add_column :users, :address
    add_column :users, :phone
    add_column :users, :linkedin
    add_column :users, :website
    add_column :users, :token, :string
    add_column :users, :token_expiry, :datetime
  end
end
