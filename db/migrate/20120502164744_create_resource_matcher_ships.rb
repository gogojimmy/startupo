class CreateResourceMatcherShips < ActiveRecord::Migration
  def change
    create_table :resource_matcher_ships do |t|
      t.integer :user_id
      t.integer :resource_id

      t.timestamps
    end
  end
end
