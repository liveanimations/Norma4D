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

ActiveRecord::Schema.define(version: 20160714233319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "effect_id"
    t.integer  "collection_id"
    t.integer  "auto_responder_id"
  end

  add_index "applications", ["auto_responder_id"], name: "index_applications_on_auto_responder_id", using: :btree
  add_index "applications", ["collection_id"], name: "index_applications_on_collection_id", using: :btree
  add_index "applications", ["effect_id"], name: "index_applications_on_effect_id", using: :btree

  create_table "auto_responders", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.decimal  "price",                                      null: false
    t.string   "name_ru"
    t.string   "name_en"
    t.integer  "version",                    default: 1
    t.text     "description_ru"
    t.text     "description_en"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
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
    t.boolean  "hide",                       default: false
    t.string   "dat_file_name"
    t.string   "dat_content_type"
    t.integer  "dat_file_size"
    t.datetime "dat_updated_at"
    t.string   "xml_file_name"
    t.string   "xml_content_type"
    t.integer  "xml_file_size"
    t.datetime "xml_updated_at"
  end

  add_index "collections", ["application_id"], name: "index_collections_on_application_id", using: :btree

  create_table "commercials", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
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
    t.string   "title_ru"
    t.text     "description_ru"
    t.decimal  "price"
    t.string   "url"
    t.string   "description_en"
    t.string   "title_en"
    t.integer  "version",             default: 1
  end

  add_index "commercials", ["application_id"], name: "index_commercials_on_application_id", using: :btree
  add_index "commercials", ["collection_id"], name: "index_commercials_on_collection_id", using: :btree

  create_table "devices", force: :cascade do |t|
    t.string   "token",          null: false
    t.string   "device_type",    null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "application_id"
    t.string   "lang"
  end

  add_index "devices", ["application_id"], name: "index_devices_on_application_id", using: :btree
  add_index "devices", ["token"], name: "index_devices_on_token", unique: true, using: :btree

  create_table "effects", force: :cascade do |t|
    t.string   "name_ru"
    t.string   "name_en"
    t.integer  "version",                        default: 1
    t.text     "description_ru"
    t.text     "description_en"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
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
    t.string   "dat_file_name"
    t.string   "dat_content_type"
    t.integer  "dat_file_size"
    t.datetime "dat_updated_at"
    t.string   "xml_file_name"
    t.string   "xml_content_type"
    t.integer  "xml_file_size"
    t.datetime "xml_updated_at"
    t.boolean  "hide",                           default: false
    t.integer  "ios_count_downloads",            default: 0
    t.integer  "android_count_downloads",        default: 0
  end

  add_index "effects", ["application_id"], name: "index_effects_on_application_id", using: :btree
  add_index "effects", ["collection_id"], name: "index_effects_on_collection_id", using: :btree

  create_table "errors", force: :cascade do |t|
    t.string   "message"
    t.string   "stack_trace"
    t.string   "error_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "errors", ["stack_trace"], name: "index_errors_on_stack_trace", unique: true, using: :btree

  create_table "notifications", force: :cascade do |t|
    t.string   "name_ru"
    t.string   "text_ru"
    t.integer  "application_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name_en"
    t.string   "text_en"
  end

  add_index "notifications", ["application_id"], name: "index_notifications_on_application_id", using: :btree

  create_table "rails_push_notifications_apns_apps", force: :cascade do |t|
    t.text     "apns_dev_cert"
    t.text     "apns_prod_cert"
    t.boolean  "sandbox_mode"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "rails_push_notifications_gcm_apps", force: :cascade do |t|
    t.string   "gcm_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rails_push_notifications_mpns_apps", force: :cascade do |t|
    t.text     "cert"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rails_push_notifications_notifications", force: :cascade do |t|
    t.text     "destinations"
    t.integer  "app_id"
    t.string   "app_type"
    t.text     "data"
    t.text     "results"
    t.integer  "success"
    t.integer  "failed"
    t.boolean  "sent",         default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "rails_push_notifications_notifications", ["app_id", "app_type", "sent"], name: "app_and_sent_index_on_rails_push_notifications", using: :btree

  create_table "rpush_apps", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "environment"
    t.text     "certificate"
    t.string   "password"
    t.integer  "connections",             default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",                                null: false
    t.string   "auth_key"
    t.string   "client_id"
    t.string   "client_secret"
    t.string   "access_token"
    t.datetime "access_token_expiration"
  end

  create_table "rpush_feedback", force: :cascade do |t|
    t.string   "device_token", limit: 64, null: false
    t.datetime "failed_at",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "app_id"
  end

  add_index "rpush_feedback", ["device_token"], name: "index_rpush_feedback_on_device_token", using: :btree

  create_table "rpush_notifications", force: :cascade do |t|
    t.integer  "badge"
    t.string   "device_token",      limit: 64
    t.string   "sound",                        default: "default"
    t.text     "alert"
    t.text     "data"
    t.integer  "expiry",                       default: 86400
    t.boolean  "delivered",                    default: false,     null: false
    t.datetime "delivered_at"
    t.boolean  "failed",                       default: false,     null: false
    t.datetime "failed_at"
    t.integer  "error_code"
    t.text     "error_description"
    t.datetime "deliver_after"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "alert_is_json",                default: false
    t.string   "type",                                             null: false
    t.string   "collapse_key"
    t.boolean  "delay_while_idle",             default: false,     null: false
    t.text     "registration_ids"
    t.integer  "app_id",                                           null: false
    t.integer  "retries",                      default: 0
    t.string   "uri"
    t.datetime "fail_after"
    t.boolean  "processing",                   default: false,     null: false
    t.integer  "priority"
    t.text     "url_args"
    t.string   "category"
    t.boolean  "content_available",            default: false
    t.text     "notification"
  end

  add_index "rpush_notifications", ["delivered", "failed"], name: "index_rpush_notifications_multi", where: "((NOT delivered) AND (NOT failed))", using: :btree

  create_table "user_emails", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "applications", "auto_responders"
  add_foreign_key "applications", "collections"
  add_foreign_key "applications", "effects"
  add_foreign_key "collections", "applications"
  add_foreign_key "commercials", "applications"
  add_foreign_key "commercials", "collections"
  add_foreign_key "devices", "applications"
  add_foreign_key "effects", "applications"
  add_foreign_key "effects", "collections"
  add_foreign_key "notifications", "applications"
end
