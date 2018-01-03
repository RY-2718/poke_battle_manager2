# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180103062557) do

  create_table "battle_my_pokes", force: :cascade do |t|
    t.integer "battle_id", limit: 4
    t.integer "my_poke_id", limit: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment", limit: 65535
    t.index ["battle_id"], name: "index_battle_my_pokes_on_battle_id"
    t.index ["my_poke_id"], name: "index_battle_my_pokes_on_my_poke_id"
  end

  create_table "battle_opp_pokes", force: :cascade do |t|
    t.integer "battle_id", limit: 4
    t.integer "opp_poke_id", limit: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment", limit: 65535
    t.index ["battle_id"], name: "index_battle_opp_pokes_on_battle_id"
    t.index ["opp_poke_id"], name: "index_battle_opp_pokes_on_opp_poke_id"
  end

  create_table "battles", force: :cascade do |t|
    t.integer "my_rate", limit: 4
    t.integer "opp_rate", limit: 4
    t.boolean "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", limit: 4
    t.index ["user_id"], name: "index_battles_on_user_id"
  end

  create_table "evals", force: :cascade do |t|
    t.integer "eval", limit: 4
    t.integer "battle_id", limit: 4
    t.integer "my_poke_id", limit: 4
    t.integer "opp_poke_id", limit: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battle_id"], name: "index_evals_on_battle_id"
    t.index ["my_poke_id"], name: "index_evals_on_my_poke_id"
    t.index ["opp_poke_id"], name: "index_evals_on_opp_poke_id"
  end

  create_table "my_pokes", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "item", limit: 255
    t.string "ability", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "in_party"
    t.integer "user_id", limit: 4
    t.index ["user_id"], name: "index_my_pokes_on_user_id"
  end

  create_table "opp_pokes", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "item", limit: 255
    t.string "ability", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", limit: 4, default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", limit: 255
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
