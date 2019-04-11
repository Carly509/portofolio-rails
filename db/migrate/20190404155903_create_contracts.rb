class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.string :title 
      t.string :content
      t.timestamps null: false
    end
  end
end
