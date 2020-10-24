class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.timestamps 
      t.string :email, NULL: false

      
    end
    add_index :users, :email, unique:true
  end
end