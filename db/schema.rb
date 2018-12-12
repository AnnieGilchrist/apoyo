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

ActiveRecord::Schema.define(version: 2018_12_12_144815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "website"
    t.string "charity_preferences"
    t.string "services_offered"
    t.text "description"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "location"
  end

  create_table "charities", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "website"
    t.string "category"
    t.text "description"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "location"
  end

  create_table "conversations", force: :cascade do |t|
    t.string "participant_a_type"
    t.bigint "participant_a_id"
    t.string "participant_b_type"
    t.bigint "participant_b_id"
    t.bigint "partnership_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_a_type", "participant_a_id"], name: "index_conversations_on_participant_a_type_and_participant_a_id"
    t.index ["participant_b_type", "participant_b_id"], name: "index_conversations_on_participant_b_type_and_participant_b_id"
    t.index ["partnership_id"], name: "index_conversations_on_partnership_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "followed_id"
    t.bigint "follower_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "followed_type"
    t.string "follower_type"
    t.index ["followed_id"], name: "index_follows_on_followed_id"
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "conversation_id"
    t.string "direction"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "missions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.integer "duration"
    t.bigint "charity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["charity_id"], name: "index_missions_on_charity_id"
  end

  create_table "partnerships", force: :cascade do |t|
    t.text "details"
    t.string "status", default: "pending"
    t.bigint "mission_id"
    t.bigint "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_partnerships_on_business_id"
    t.index ["mission_id"], name: "index_partnerships_on_mission_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "organisation_type"
    t.bigint "organisation_id"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organisation_type", "organisation_id"], name: "index_users_on_organisation_type_and_organisation_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "conversations", "partnerships"
  add_foreign_key "messages", "conversations"
  add_foreign_key "missions", "charities"
  add_foreign_key "partnerships", "businesses"
  add_foreign_key "partnerships", "missions"
end
