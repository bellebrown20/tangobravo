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

ActiveRecord::Schema[7.0].define(version: 2023_03_31_151618) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "fuzzystrmatch"
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "airplanes", force: :cascade do |t|
    t.string "make"
    t.string "engines"
    t.string "tailnumber"
    t.string "home_airport"
    t.integer "minimum_hours"
    t.string "required_licenses"
    t.bigint "user_id", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "address"
    t.string "price_per_hour"
    t.string "ownership"
    t.text "make_dmetaphone"
    t.text "engines_dmetaphone"
    t.text "tailnumber_dmetaphone"
    t.text "home_airport_dmetaphone"
    t.float "review_average", default: 0.0
    t.index ["engines_dmetaphone"], name: "airplanes_engines_dmetaphone_idx", opclass: :gin_trgm_ops, using: :gin
    t.index ["home_airport_dmetaphone"], name: "airplanes_home_airport_dmetaphone_idx", opclass: :gin_trgm_ops, using: :gin
    t.index ["make_dmetaphone"], name: "airplanes_make_dmetaphone_idx", opclass: :gin_trgm_ops, using: :gin
    t.index ["tailnumber_dmetaphone"], name: "airplanes_tailnumber_dmetaphone_idx", opclass: :gin_trgm_ops, using: :gin
    t.index ["user_id"], name: "index_airplanes_on_user_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "airplane_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: false
    t.index ["airplane_id"], name: "index_inquiries_on_airplane_id"
    t.index ["user_id"], name: "index_inquiries_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "inquiry_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read", default: false
    t.index ["inquiry_id"], name: "index_messages_on_inquiry_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "airplane_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airplane_id"], name: "index_reviews_on_airplane_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "license"
    t.integer "fly_hours"
    t.string "role"
    t.string "name"
    t.string "nickname"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "airplanes", "users"
  add_foreign_key "inquiries", "airplanes"
  add_foreign_key "inquiries", "users"
  add_foreign_key "messages", "inquiries"
  add_foreign_key "messages", "users"
  add_foreign_key "reviews", "airplanes"
  add_foreign_key "reviews", "users"
end
