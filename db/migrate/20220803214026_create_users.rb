class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false 
      t.string :email, null: false 
      t.boolean :activated, null: false, default: false 
      t.string :activation_token, null: false


      t.timestamps
    end

    add_index :users, :email 
    add_index :users, :session_token, unique: true
    add_index :users, :activation_token, unique: true
  end
end