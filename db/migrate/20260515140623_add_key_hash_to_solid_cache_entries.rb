class AddKeyHashToSolidCacheEntries < ActiveRecord::Migration[8.0]
  def change
    # The key_hash is an 8-byte integer (bigint)
    add_column :solid_cache_entries, :key_hash, :integer, limit: 8, null: false

    # Solid Cache relies on this index for performance
    add_index :solid_cache_entries, :key_hash, unique: true

    # We can remove the index on the raw 'key' binary if it exists
    # to save space, but let's just get you running first.
  end
end
