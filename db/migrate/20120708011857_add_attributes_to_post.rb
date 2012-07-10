class AddAttributesToPost < ActiveRecord::Migration
  def change
    add_column :posts, :status, :string
    add_column :posts, :user_id, :integer
    add_index :posts, :user_id
    add_index :status
  end
end
