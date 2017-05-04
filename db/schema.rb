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

ActiveRecord::Schema.define(version: 20170504162748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"
  enable_extension "unaccent"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.text     "decription"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenge_skills", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["challenge_id"], name: "index_challenge_skills_on_challenge_id", using: :btree
    t.index ["skill_id"], name: "index_challenge_skills_on_skill_id", using: :btree
  end

  create_table "challenges", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "visible"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_challenges_on_category_id", using: :btree
  end

  create_table "constraints", force: :cascade do |t|
    t.integer  "challenge_id"
    t.string   "title"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["challenge_id"], name: "index_constraints_on_challenge_id", using: :btree
  end

  create_table "game_skills", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "skill_id"
    t.integer  "mentor_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_skills_on_game_id", using: :btree
    t.index ["mentor_id"], name: "index_game_skills_on_mentor_id", using: :btree
    t.index ["skill_id"], name: "index_game_skills_on_skill_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.integer  "constraint_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["challenge_id"], name: "index_games_on_challenge_id", using: :btree
    t.index ["constraint_id"], name: "index_games_on_constraint_id", using: :btree
    t.index ["user_id"], name: "index_games_on_user_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "labeled"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.datetime "birthday"
    t.string   "address"
    t.string   "phone"
    t.string   "linkedin"
    t.string   "website"
    t.string   "token"
    t.datetime "token_expiry"
    t.boolean  "admin",                  default: false, null: false
    t.integer  "specialty_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["specialty_id"], name: "index_users_on_specialty_id", using: :btree
  end

  add_foreign_key "challenge_skills", "challenges"
  add_foreign_key "challenge_skills", "skills"
  add_foreign_key "challenges", "categories"
  add_foreign_key "constraints", "challenges"
  add_foreign_key "game_skills", "games"
  add_foreign_key "game_skills", "skills"
  add_foreign_key "games", "challenges"
  add_foreign_key "games", "constraints"
  add_foreign_key "games", "users"
end
