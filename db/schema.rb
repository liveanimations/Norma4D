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

ActiveRecord::Schema.define(version: 20160515071532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "effect_id"
    t.integer  "collection_id"
  end

  add_index "applications", ["collection_id"], name: "index_applications_on_collection_id", using: :btree
  add_index "applications", ["effect_id"], name: "index_applications_on_effect_id", using: :btree

  create_table "collections", force: :cascade do |t|
    t.decimal  "price",                                     null: false
    t.string   "name_ru"
    t.string   "name_en"
    t.integer  "version",                    default: 1
    t.text     "description_ru"
    t.text     "description_en"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "application_id"
    t.string   "small_icon_file_name"
    t.string   "small_icon_content_type"
    t.integer  "small_icon_file_size"
    t.datetime "small_icon_updated_at"
    t.string   "small_icon_2_file_name"
    t.string   "small_icon_2_content_type"
    t.integer  "small_icon_2_file_size"
    t.datetime "small_icon_2_updated_at"
    t.string   "large_icon_file_name"
    t.string   "large_icon_content_type"
    t.integer  "large_icon_file_size"
    t.datetime "large_icon_updated_at"
    t.string   "large_icon_2_file_name"
    t.string   "large_icon_2_content_type"
    t.integer  "large_icon_2_file_size"
    t.datetime "large_icon_2_updated_at"
    t.string   "product"
    t.boolean  "printable"
    t.string   "medium_icon_file_name"
    t.string   "medium_icon_content_type"
    t.integer  "medium_icon_file_size"
    t.datetime "medium_icon_updated_at"
    t.string   "medium_icon_2_file_name"
    t.string   "medium_icon_2_content_type"
    t.integer  "medium_icon_2_file_size"
    t.datetime "medium_icon_2_updated_at"
    t.decimal  "app_version"
    t.boolean  "avaliable",                  default: true
  end

  add_index "collections", ["application_id"], name: "index_collections_on_application_id", using: :btree

  create_table "commercials", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "collection_id"
    t.string   "image1_file_name"
    t.string   "image1_content_type"
    t.integer  "image1_file_size"
    t.datetime "image1_updated_at"
    t.string   "image2_file_name"
    t.string   "image2_content_type"
    t.integer  "image2_file_size"
    t.datetime "image2_updated_at"
    t.integer  "application_id"
    t.string   "name"
  end

  add_index "commercials", ["application_id"], name: "index_commercials_on_application_id", using: :btree
  add_index "commercials", ["collection_id"], name: "index_commercials_on_collection_id", using: :btree

  create_table "effects", force: :cascade do |t|
    t.string   "name_ru"
    t.string   "name_en"
    t.integer  "version",                        default: 1
    t.text     "description_ru"
    t.text     "description_en"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "application_id"
    t.integer  "collection_id"
    t.string   "small_icon_file_name"
    t.string   "small_icon_content_type"
    t.integer  "small_icon_file_size"
    t.datetime "small_icon_updated_at"
    t.string   "small_icon_2_file_name"
    t.string   "small_icon_2_content_type"
    t.integer  "small_icon_2_file_size"
    t.datetime "small_icon_2_updated_at"
    t.string   "large_icon_file_name"
    t.string   "large_icon_content_type"
    t.integer  "large_icon_file_size"
    t.datetime "large_icon_updated_at"
    t.string   "large_icon_2_file_name"
    t.string   "large_icon_2_content_type"
    t.integer  "large_icon_2_file_size"
    t.datetime "large_icon_2_updated_at"
    t.string   "assets_ios_file_name"
    t.string   "assets_ios_content_type"
    t.integer  "assets_ios_file_size"
    t.datetime "assets_ios_updated_at"
    t.string   "assets_android_file_name"
    t.string   "assets_android_content_type"
    t.integer  "assets_android_file_size"
    t.datetime "assets_android_updated_at"
    t.string   "page_for_printing_file_name"
    t.string   "page_for_printing_content_type"
    t.integer  "page_for_printing_file_size"
    t.datetime "page_for_printing_updated_at"
    t.string   "tmp1_file_name"
    t.string   "tmp1_content_type"
    t.integer  "tmp1_file_size"
    t.datetime "tmp1_updated_at"
    t.string   "tmp2_file_name"
    t.string   "tmp2_content_type"
    t.integer  "tmp2_file_size"
    t.datetime "tmp2_updated_at"
    t.boolean  "avaliable",                      default: true
    t.integer  "ios_count_downloads",            default: 0
    t.integer  "android_count_downloads",        default: 0
  end

  add_index "effects", ["application_id"], name: "index_effects_on_application_id", using: :btree
  add_index "effects", ["collection_id"], name: "index_effects_on_collection_id", using: :btree

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
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "applications", "collections"
  add_foreign_key "applications", "effects"
  add_foreign_key "collections", "applications"
  add_foreign_key "commercials", "applications"
  add_foreign_key "commercials", "collections"
  add_foreign_key "effects", "applications"
  add_foreign_key "effects", "collections"
end
