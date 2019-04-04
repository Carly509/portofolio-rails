class AddContractualIdToContracts < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :contractual_id, :integer
  end
end
