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

ActiveRecord::Schema.define(version: 20161022072237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "stars", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "repo_id"
    t.string   "repo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "starred_at"
    t.index ["user_id", "repo_id"], name: "index_stars_on_user_id_and_repo_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_stars_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.bigint   "userid"
    t.string   "nick"
    t.string   "token"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "stars_count", default: 0
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["userid"], name: "index_users_on_userid", unique: true, using: :btree
  end

end
