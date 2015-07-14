class AddToContractIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :contract_id, :integer
  end
end
