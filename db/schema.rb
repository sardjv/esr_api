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

ActiveRecord::Schema.define(version: 2020_04_09_131233) do

  create_table "absence_records", force: :cascade do |t|
    t.string "Record Type"
    t.string "PersonID"
    t.string "Absence AttendanceID"
    t.string "Absence Type"
    t.string "Absence Reason"
    t.string "Status"
    t.date "Notification Date"
    t.date "Projected StartDate"
    t.string "Projected StartTime"
    t.date "Projected EndDate"
    t.string "Projected EndTime"
    t.date "Actual StartDate"
    t.string "Actual StartTime"
    t.date "Actual EndDate"
    t.string "Actual EndTime"
    t.date "Sickness StartDate"
    t.date "Sickness DateEnd"
    t.string "Absence Duration Days"
    t.string "Absence Duration Hours"
    t.string "Absence Units"
    t.string "Hours Lost"
    t.string "Sessions Lost"
    t.string "Work Related"
    t.string "Third Party"
    t.string "Disability Related"
    t.string "Violence AggressionRelated"
    t.string "Notifyable Disease"
    t.date "Returntowork discussiondate"
    t.date "OccupationalHealth referralDate"
    t.datetime "Last UpdateDate"
    t.string "Surgery Related"
    t.string "DH Monitoring"
    t.string "Sickness Reason"
    t.string "3rdParty SystemReference"
    t.datetime "Ins_Upd_TimeStamp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "person_records", force: :cascade do |t|
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
    t.datetime "Ins_Upd_TimeStamp"
  end

  create_table "position_records", force: :cascade do |t|
    t.string "Record Type"
    t.string "PositionID"
    t.date "Effective FromDate"
    t.date "Effective ToDate"
    t.string "Position Number"
    t.string "Position Name"
    t.string "Budgeted FTE"
    t.string "Subjective Code"
    t.string "Job StaffGroup"
    t.string "Job Role"
    t.string "Occupation Code"
    t.string "Payscale"
    t.string "Grade Step"
    t.string "ISA Regulated Post"
    t.string "Organisation ID"
    t.string "Hiring Status"
    t.string "Position Type"
    t.string "Workplace OrgCode"
    t.datetime "Last UpdateDate"
    t.string "Subjective CodeDescription"
    t.datetime "Ins_Upd_TimeStamp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
