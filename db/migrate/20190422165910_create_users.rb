class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    
    create_table :users do |t|
    t.string "username", :limit => 50
    t.string "email", :default => '', :null => false
    t.string "password", :limit => 40


      t.timestamps
    end
  end
end
