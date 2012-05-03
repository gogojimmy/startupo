class AddPrivacyToResource < ActiveRecord::Migration
  def change
    add_column :resources, :privacy, :string

  end
end
