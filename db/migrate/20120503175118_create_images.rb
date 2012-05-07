class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :description
      t.integer :event_id

      t.timestamps
    end
    add_index :images, :event_id
  end
end
