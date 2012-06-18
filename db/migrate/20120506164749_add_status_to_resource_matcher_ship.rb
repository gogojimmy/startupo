class AddStatusToResourceMatcherShip < ActiveRecord::Migration
  def change
    add_column :resource_matcher_ships, :status, :string, :default => 'pending'
  end
end
