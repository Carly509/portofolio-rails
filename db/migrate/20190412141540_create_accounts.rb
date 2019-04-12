class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      
      t.belongs_to :user_id, index: true
      t.timestamps
    end

    add_index :accounts, :user_id
  end
end
