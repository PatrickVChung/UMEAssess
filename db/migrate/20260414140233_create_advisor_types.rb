class CreateAdvisorTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :advisor_types do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :advisor_types, :name, unique: true

    #["Academic", "Academic/Student Affairs", "Assist Dean", "Career", "Career/Student Affairs", "DEIB", "Wellness"]

    # Populate data
    reversible do |dir|
      dir.up do
        # Using execute for direct SQL is safe for seeding
        execute "INSERT INTO advisor_types (name, created_at, updated_at) VALUES ('Academic', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)"
        execute "INSERT INTO advisor_types (name, created_at, updated_at) VALUES ('Academic/Student Affairs', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)"
        execute "INSERT INTO advisor_types (name, created_at, updated_at) VALUES ('Assist Dean', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)"
        execute "INSERT INTO advisor_types (name, created_at, updated_at) VALUES ('Carrer', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)"
        execute "INSERT INTO advisor_types (name, created_at, updated_at) VALUES ('Career/Student Affairs', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)"
        execute "INSERT INTO advisor_types (name, created_at, updated_at) VALUES ('DEIB', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)"
        execute "INSERT INTO advisor_types (name, created_at, updated_at) VALUES ('Wellness', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)"
      end
    end
  end
end
