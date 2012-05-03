class AddApprovedByToResource < ActiveRecord::Migration
  def change
    add_column :resources, :approved_by, :integer
    add_index :resources, :approved_by
  end
end
