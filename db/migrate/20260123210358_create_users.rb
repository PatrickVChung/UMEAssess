class CreateUsers < ActiveRecord::Migration[8.0]
  def change
      create_table :users do |t|
        t.string :username, null: false # Add this for OHSU ID
        t.string :email_address, null: false
        t.string :password_digest, null: true # Allow NULL because LDAP handles the password
        t.string :full_name
        t.boolean :is_ldap, default: true

        t.timestamps
      end
      add_index :users, :username, unique: true
      add_index :users, :email_address, unique: true
    end
end
