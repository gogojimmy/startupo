class CreateResourceAdminCategoryShips < ActiveRecord::Migration
  def change
    create_table :resource_admin_category_ships do |t|
      t.integer :resource_id
      t.integer :admin_category_id

      t.timestamps
    end
  end
end
