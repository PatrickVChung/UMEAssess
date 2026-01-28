# ---------------------------------------------------------
# Disable autoloading BEFORE Rails boots
# ---------------------------------------------------------
ENV["DISABLE_AUTLOAD"] = "true"

# Monkey‑patch Zeitwerk to ignore app/models before Rails loads
module Rails
  class Application
    class Configuration
      def eager_load_paths
        []
      end
    end
  end
end

# Run with: bin/rails runner script/move_tables.rb
# Define your DB1 and DB2 base classes
class Db1Base < ApplicationRecord
  self.abstract_class = true
  connects_to database: { reading: :secondary, writing: :secondary }
end

class Db2Base < ApplicationRecord
  self.abstract_class = true
  connects_to database: { reading: :primary, writing: :primary }
end

# Example table models
class Db1User < Db1Base
  self.table_name = "users"
end

class Db2User < Db2Base
  self.table_name = "users"
end

class Db1PermissionGroups < Db1Base
  self.table_name = "permission_groups"
end

class Db2PermissionGroups < Db2Base
  self.table_name = "permission_groups"
end

# Tables to migrate
TABLES = {
  users:   { source: Db1User,   target: Db2User },
  permission_groups: { source: Db1PermissionGroups, target: Db2PermissionGroups }
}

BATCH_SIZE = 500

puts "Starting multi-table migration..."

TABLES.each do |name, cfg|
  source = cfg[:source]
  target = cfg[:target]

  puts "\n=== Checking #{name} ==="

  if target.exists?
    puts "  Skipping #{name} — target already has data."
    next
  end

  puts "  Moving #{name}..."

  source.find_in_batches(batch_size: BATCH_SIZE) do |batch|
    puts "    Batch of #{batch.size}"

    batch.each do |row|

  byebug
      attrs = row.attributes.except("pinned_survey_group_titles")
      target.create!(attrs)
    end
  end

  puts "=== Finished #{name} ==="
end

puts "\nAll tables migrated."
