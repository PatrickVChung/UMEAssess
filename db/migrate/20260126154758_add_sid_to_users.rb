class AddSidToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :sid, :string
    add_column :users, :permission_group_id, :integer
    add_column :users, :prev_permission_group_id, :integer
    add_column :users, :roles, :text
    add_column :users, :cohort_id, :integer
    add_column :users, :coaching_type, :string
    add_column :users, :spec_program, :string

    add_column :users, :uuid, :uuid, default: 'gen_random_uuid()', null: false

    add_column :users, :subscribed, :boolean, default: false, null: false
    add_column :users, :matriculated_date, :date
    add_column :users, :new_competency, :boolean

    add_column :users, :former_name, :string
    add_column :users, :career_interest, :string,  default: [], array: true

    add_column :users, :last_sign_in_at, :datetime, precision: nil
    add_column :users, :last_sign_in_ip, :string, limit: 255

    add_index :users, :sid, unique: true
    add_index :users, :uuid, unique: true

  end
end
