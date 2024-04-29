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

ActiveRecord::Schema[7.2].define(version: 2024_04_29_181249) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "nick_name"
    t.string "given_name"
    t.string "gender", null: false
    t.bigint "species_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name", "last_name", "gender"], name: "index_characters_on_first_name_and_last_name_and_gender", unique: true
    t.index ["species_id"], name: "index_characters_on_species_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_name"], name: "index_companies_on_company_name", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.string "role", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
    t.index ["role", "company_id"], name: "index_jobs_on_role_and_company_id", unique: true
  end

  create_table "person_jobs", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date"
    t.bigint "person_id", null: false
    t.bigint "job_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_person_jobs_on_job_id"
    t.index ["person_id", "job_id", "start_date"], name: "index_person_jobs_on_person_id_and_job_id_and_start_date", unique: true
    t.index ["person_id"], name: "index_person_jobs_on_person_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "species_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["species_name"], name: "index_species_on_species_name", unique: true
  end

  add_foreign_key "characters", "species"
  add_foreign_key "jobs", "companies"
  add_foreign_key "person_jobs", "characters", column: "person_id"
  add_foreign_key "person_jobs", "jobs"
end
