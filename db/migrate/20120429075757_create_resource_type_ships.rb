class CreateResourceTypeShips < ActiveRecord::Migration
  def change
    create_table :resource_type_ships do |t|
      t.integer :resource_id
      t.integer :resource_type_id

      t.timestamps
    end
    add_index :resource_type_ships, :resource_id
    add_index :resource_type_ships, :resource_type_id
  end
end
