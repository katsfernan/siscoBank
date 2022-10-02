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

ActiveRecord::Schema[7.0].define(version: 2022_10_02_142131) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "identifier_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_identifiers", force: :cascade do |t|
    t.integer "identifierNumber", null: false
    t.datetime "emissionDate", null: false
    t.datetime "expirationDate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "identifier_type_id", null: false
    t.index ["identifier_type_id"], name: "index_person_identifiers_on_identifier_type_id"
  end

  create_table "person_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.integer "primaryPhone", null: false
    t.integer "secondaryPhone"
    t.bigint "person_type_id", null: false
    t.bigint "person_identifier_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["person_identifier_id"], name: "index_users_on_person_identifier_id"
    t.index ["person_type_id"], name: "index_users_on_person_type_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "person_identifiers", "identifier_types"
  add_foreign_key "users", "person_identifiers"
  add_foreign_key "users", "person_types"
end