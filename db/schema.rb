# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_21_150137) do

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

  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "street"
    t.string "number"
    t.string "zipcode"
    t.string "state"
    t.string "neighborhood"
    t.float "latitude"
    t.float "longitude"
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_addresses_on_organization_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "kind"
    t.string "value"
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_contacts_on_organization_id"
  end

  create_table "expertises", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "health_insurers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "health_plans", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "health_insurer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["health_insurer_id"], name: "index_health_plans_on_health_insurer_id"
  end

  create_table "intervals", force: :cascade do |t|
    t.string "description"
    t.integer "start"
    t.integer "finish"
    t.integer "step"
    t.integer "counts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "medic_expertises", force: :cascade do |t|
    t.bigint "expertise_id", null: false
    t.bigint "medic_id", null: false
    t.index ["expertise_id"], name: "index_medic_expertises_on_expertise_id"
    t.index ["medic_id"], name: "index_medic_expertises_on_medic_id"
  end

  create_table "medics", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "on_shift", default: false
    t.index ["organization_id"], name: "index_medics_on_organization_id"
  end

  create_table "occupancies", force: :cascade do |t|
    t.integer "start"
    t.integer "finish"
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_occupancies_on_organization_id"
  end

  create_table "organization_health_plan_expertises", force: :cascade do |t|
    t.bigint "health_plan_id", null: false
    t.bigint "organization_id", null: false
    t.bigint "expertise_id", null: false
    t.index ["expertise_id"], name: "index_organization_health_plan_expertises_on_expertise_id"
    t.index ["health_plan_id"], name: "index_organization_health_plan_expertises_on_health_plan_id"
    t.index ["organization_id"], name: "index_organization_health_plan_expertises_on_organization_id"
  end

  create_table "organization_settings", force: :cascade do |t|
    t.bigint "interval_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interval_id"], name: "index_organization_settings_on_interval_id"
    t.index ["organization_id"], name: "index_organization_settings_on_organization_id"
  end

  create_table "organization_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_organization_users_on_email", unique: true
    t.index ["organization_id"], name: "index_organization_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_organization_users_on_reset_password_token", unique: true
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.integer "kind"
    t.string "cnes"
    t.boolean "covid_attendance"
    t.string "cnpj"
    t.string "hours"
    t.boolean "scheduling"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "has_emergency"
  end

  create_table "reports", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_reports_on_organization_id"
  end

  create_table "solicitations", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "organizations"
  add_foreign_key "contacts", "organizations"
  add_foreign_key "health_plans", "health_insurers"
  add_foreign_key "medic_expertises", "expertises"
  add_foreign_key "medic_expertises", "medics"
  add_foreign_key "medics", "organizations"
  add_foreign_key "occupancies", "organizations"
  add_foreign_key "organization_health_plan_expertises", "expertises"
  add_foreign_key "organization_health_plan_expertises", "health_plans"
  add_foreign_key "organization_health_plan_expertises", "organizations"
  add_foreign_key "organization_settings", "intervals"
  add_foreign_key "organization_settings", "organizations"
  add_foreign_key "organization_users", "organizations"
  add_foreign_key "reports", "organizations"
end
