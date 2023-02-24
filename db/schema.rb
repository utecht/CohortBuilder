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

ActiveRecord::Schema[7.0].define(version: 2023_02_24_021349) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.string "nbia_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concept_matches", force: :cascade do |t|
    t.integer "concept_id", null: false
    t.integer "option_id", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concept_id"], name: "index_concept_matches_on_concept_id"
    t.index ["option_id"], name: "index_concept_matches_on_option_id"
  end

  create_table "concepts", force: :cascade do |t|
    t.string "obo_class"
    t.string "label"
    t.text "definition"
    t.text "rdf_template"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.text "preview"
    t.integer "collection_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "processed", default: false
    t.index ["collection_id"], name: "index_documents_on_collection_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "ctype"
    t.json "example"
    t.json "stats"
    t.text "description"
    t.integer "document_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "processed", default: false
    t.string "name"
    t.index ["document_id"], name: "index_fields_on_document_id"
  end

  create_table "options", force: :cascade do |t|
    t.integer "field_id", null: false
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_options_on_field_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "patient_id"
    t.integer "collection_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_patients_on_collection_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "type"
    t.integer "patient_id", null: false
    t.integer "field_id", null: false
    t.string "string_value"
    t.integer "option_id"
    t.integer "int_value"
    t.float "float_value"
    t.date "date_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_records_on_field_id"
    t.index ["option_id"], name: "index_records_on_option_id"
    t.index ["patient_id"], name: "index_records_on_patient_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "concept_matches", "concepts"
  add_foreign_key "concept_matches", "options"
  add_foreign_key "documents", "collections"
  add_foreign_key "fields", "documents"
  add_foreign_key "options", "fields"
  add_foreign_key "patients", "collections"
  add_foreign_key "records", "fields"
  add_foreign_key "records", "options"
  add_foreign_key "records", "patients"
end
