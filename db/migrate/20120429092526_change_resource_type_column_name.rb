class ChangeResourceTypeColumnName < ActiveRecord::Migration
  def up
    remove_column :resource_types, :descriptioin
    add_column :resource_types, :description, :string
  end

  def down
    remove_column :resource_types, :description
    add_column :resource_types, :descriptioin, :string
  end
end
