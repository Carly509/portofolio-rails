class CreateContrats < ActiveRecord::Migration[5.2]
  def change
    create_table :contrats do |t|

      t.timestamps null: false
    end
  end
end
