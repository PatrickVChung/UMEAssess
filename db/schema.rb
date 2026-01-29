# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2026_01_29_173218) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "permission_groups", id: :integer, default: nil, force: :cascade do |t|
    t.text "title", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_token"
    t.datetime "expires_at"
    t.datetime "last_seen_at"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "full_name"
    t.boolean "is_ldap", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sid"
    t.integer "permission_group_id"
    t.integer "prev_permission_group_id"
    t.text "roles"
    t.integer "cohort_id"
    t.string "coaching_type"
    t.string "spec_program"
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.boolean "subscribed", default: false, null: false
    t.date "matriculated_date"
    t.boolean "new_competency"
    t.string "former_name"
    t.string "career_interest", default: [], array: true
    t.datetime "last_sign_in_at", precision: nil
    t.string "last_sign_in_ip", limit: 255
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["sid"], name: "index_users_on_sid", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  add_foreign_key "sessions", "users"
end
