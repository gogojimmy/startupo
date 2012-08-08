class AddOmniauthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :access_token, :string
    add_index :users, :provider
    add_index :users, :uid
    add_index :users, :access_token
  end
end
