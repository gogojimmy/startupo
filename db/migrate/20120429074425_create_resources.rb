class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :user_id
      t.boolean :have_resource
      t.boolean :find_resource
      t.string :contact
      t.string :phone
      t.string :email
      t.text :description
      t.string :state
      t.boolean :to_public, :default => false

      t.timestamps
    end
    add_index :resources, :user_id
  end
end
