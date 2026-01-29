class AddRememberTokenToSessions < ActiveRecord::Migration[8.0]
  def change
    add_column :sessions, :remember_token, :string
  end
end
