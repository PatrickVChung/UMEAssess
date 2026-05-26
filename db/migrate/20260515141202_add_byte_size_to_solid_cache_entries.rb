class AddByteSizeToSolidCacheEntries < ActiveRecord::Migration[8.0]
  def change
    # byte_size tracks the size of the value in bytes
    add_column :solid_cache_entries, :byte_size, :integer, null: false
  end
end
