class CreateResourceCooperateWayShips < ActiveRecord::Migration
  def change
    create_table :resource_cooperate_way_ships do |t|
      t.integer :resource_id
      t.integer :cooperate_way_id

      t.timestamps
    end
    add_index :resource_cooperate_way_ships, :resource_id
    add_index :resource_cooperate_way_ships, :cooperate_way_id
  end
end
