class ChangeApprovedByToAssignTo < ActiveRecord::Migration
  def change
    rename_column :resources, :approved_by, :assign_to
  end
end
