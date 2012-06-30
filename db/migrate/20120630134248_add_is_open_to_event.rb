class AddIsOpenToEvent < ActiveRecord::Migration
  def change
    add_column :events, :is_open, :boolean, :default => true
  end
end
