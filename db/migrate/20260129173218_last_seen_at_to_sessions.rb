class LastSeenAtToSessions < ActiveRecord::Migration[8.0]
  def change
        add_column :sessions, :last_seen_at, :datetime
  end
end
