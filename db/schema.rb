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

ActiveRecord::Schema.define(version: 2020_04_07_111233) do

  create_table "person_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "PersonID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "Record Type"
    t.date "Effective StartDate"
    t.date "Effective EndDate"
    t.string "Employee Number"
    t.string "Title"
    t.string "LastName"
    t.string "FirstName"
    t.string "MiddleNames"
    t.string "MaidenName"
    t.string "PreferredName"
    t.string "Previous LastName"
    t.string "Gender"
    t.date "Date of Birth"
    t.string "NationalInsurance Number"
    t.string "NHS UniqueID"
    t.date "HireDate"
    t.date "ActualTermination Date"
    t.string "Termination Reason"
    t.string "Employee StatusFlag"
    t.string "WTR Opt Out"
    t.date "WTR Opt Out Date"
    t.string "Ethnic Origin"
    t.string "Country of Birth"
    t.string "Previous Employer"
    t.string "Previous EmployerType"
    t.date "CSD 3 Months"
    t.date "CSD 12 Months"
    t.string "NHS CRS UUID"
    t.string "System Person Type"
    t.string "User Person Type"
    t.string "Office e-mail address"
    t.date "NHS StartDate"
    t.date "Last UpdateDate"
    t.string "Disability Flag"
    t.timestamp "Ins_Upd_TimeStamp"
  end

end
