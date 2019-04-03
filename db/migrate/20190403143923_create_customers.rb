class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :password
      t.timestamps null: false
    end
  end
end
