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

ActiveRecord::Schema.define(version: 20171230233632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "answer", null: false
    t.integer "provider_id", null: false
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_answers_on_provider_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question", null: false
    t.integer "asker_id", null: false
    t.boolean "particular", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenant_requests", force: :cascade do |t|
    t.integer "tenant_id", null: false
    t.integer "amount", default: 0, null: false
    t.string "route", null: false
    t.datetime "created_at", default: "2017-12-01 02:53:39", null: false
    t.datetime "updated_at", default: "2017-12-01 02:53:39", null: false
    t.index ["created_at", "route", "tenant_id"], name: "index_tenant_requests_on_created_at_and_route_and_tenant_id", unique: true
  end

  create_table "tenants", force: :cascade do |t|
    t.string "api_key", null: false
    t.string "name", limit: 100, null: false
    t.string "login", limit: 80, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "login", limit: 80, null: false
    t.string "token", limit: 100, null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 100, null: false
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users", column: "provider_id"
  add_foreign_key "questions", "users", column: "asker_id"
  add_foreign_key "tenant_requests", "tenants"
end
