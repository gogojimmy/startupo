class AddAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :confirmed_by, :integer
  end
end
