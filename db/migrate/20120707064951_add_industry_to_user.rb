class AddIndustryToUser < ActiveRecord::Migration
  def change
    add_column :users, :industry, :string
    add_index :users, :industry
  end
end
