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

ActiveRecord::Schema.define(version: 2018_11_22_123709) do

  # These are extensions that must be enabled in order to support this database
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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
  end

  create_table "categories_studies", id: false, force: :cascade do |t|
    t.bigint "study_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_categories_studies_on_category_id"
    t.index ["study_id"], name: "index_categories_studies_on_study_id"
  end

  create_table "faqs", force: :cascade do |t|
    t.text "question"
    t.text "answer"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_faqs_on_product_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
  end

  create_table "groups_products", id: false, force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "product_id"
    t.index ["group_id"], name: "index_groups_products_on_group_id"
    t.index ["product_id"], name: "index_groups_products_on_product_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.string "author"
    t.boolean "visible"
    t.bigint "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["product_id"], name: "index_notes_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studies", force: :cascade do |t|
    t.string "name"
    t.text "description"
  end

  create_table "studies_products", id: false, force: :cascade do |t|
    t.bigint "study_id"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_studies_products_on_product_id"
    t.index ["study_id"], name: "index_studies_products_on_study_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "eltek"
    t.boolean "distributor"
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "faqs", "products"
  add_foreign_key "notes", "products"
end
