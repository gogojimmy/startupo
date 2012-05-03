class AddContractStateToResource < ActiveRecord::Migration
  def change
    add_column :resources, :contract_state, :string
  end
end
