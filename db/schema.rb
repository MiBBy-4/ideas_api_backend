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

ActiveRecord::Schema.define(version: 2022_02_22_135354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0
    t.string "name"
    t.string "surname"
    t.string "phone_number"
    t.string "skype"
  end

  create_table "ideas", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "problem"
    t.string "sphere"
    t.string "geo_focus"
    t.string "team"
    t.string "next_steps"
    t.string "investor_requirements"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "views", default: 0
    t.integer "responses", default: 0
    t.bigint "customer_id"
    t.float "avg_likes"
    t.float "avg_dislikes"
    t.index ["customer_id"], name: "index_ideas_on_customer_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "reactions", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "idea_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "reaction"
    t.index ["customer_id", "idea_id"], name: "index_reactions_on_customer_id_and_idea_id", unique: true
    t.index ["customer_id"], name: "index_reactions_on_customer_id"
    t.index ["idea_id"], name: "index_reactions_on_idea_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ideas", "customers"
  add_foreign_key "reactions", "customers"
  add_foreign_key "reactions", "ideas"
end
