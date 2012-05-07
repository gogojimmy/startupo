class AddTypeToResourceMatcherShip < ActiveRecord::Migration
  def change
    add_column :resource_matcher_ships, :type, :string

  end
end
