class AddIndexToAssetEventId < ActiveRecord::Migration
  def change
    add_column :assets, :event_id, :integer
    add_index :assets, :event_id
  end
end
