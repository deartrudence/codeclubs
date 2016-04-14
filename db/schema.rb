# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160414143442) do

  create_table "lessons", force: :cascade do |t|
    t.string   "title"
    t.integer  "duration_in_seconds"
    t.integer  "level"
    t.text     "description"
    t.text     "curriculum_concepts"
    t.text     "prep"
    t.text     "programming_concepts"
    t.text     "content"
    t.text     "extensions"
    t.text     "answers"
    t.string   "video_link"
    t.integer  "profile_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "feature_image_file_name"
    t.string   "feature_image_content_type"
    t.integer  "feature_image_file_size"
    t.datetime "feature_image_updated_at"
    t.string   "file_upload_file_name"
    t.string   "file_upload_content_type"
    t.integer  "file_upload_file_size"
    t.datetime "file_upload_updated_at"
    t.integer  "cached_votes_total",         default: 0
    t.integer  "cached_votes_score",         default: 0
    t.integer  "cached_votes_up",            default: 0
    t.integer  "cached_votes_down",          default: 0
    t.integer  "cached_weighted_score",      default: 0
    t.integer  "cached_weighted_total",      default: 0
    t.float    "cached_weighted_average",    default: 0.0
  end

  add_index "lessons", ["cached_votes_down"], name: "index_lessons_on_cached_votes_down"
  add_index "lessons", ["cached_votes_score"], name: "index_lessons_on_cached_votes_score"
  add_index "lessons", ["cached_votes_total"], name: "index_lessons_on_cached_votes_total"
  add_index "lessons", ["cached_votes_up"], name: "index_lessons_on_cached_votes_up"
  add_index "lessons", ["cached_weighted_average"], name: "index_lessons_on_cached_weighted_average"
  add_index "lessons", ["cached_weighted_score"], name: "index_lessons_on_cached_weighted_score"
  add_index "lessons", ["cached_weighted_total"], name: "index_lessons_on_cached_weighted_total"
  add_index "lessons", ["profile_id"], name: "index_lessons_on_profile_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "school"
    t.string   "role"
    t.string   "grade"
    t.boolean  "mailing_list"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
