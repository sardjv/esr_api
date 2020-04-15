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

ActiveRecord::Schema.define(version: 2020_04_15_161633) do

  create_table "absence_records", force: :cascade do |t|
    t.string "Record Type"
    t.string "Person ID"
    t.string "Absence Attendance ID"
    t.string "Absence Type"
    t.string "Absence Reason"
    t.string "Status"
    t.date "Notification Date"
    t.date "Projected Start Date"
    t.string "Projected Start Time"
    t.date "Projected End Date"
    t.string "Projected End Time"
    t.date "Actual Start Date"
    t.string "Actual Start Time"
    t.date "Actual End Date"
    t.string "Actual End Time"
    t.date "Sickness Start Date"
    t.date "Sickness Date End"
    t.string "Absence Duration Days"
    t.string "Absence Duration Hours"
    t.string "Absence Units"
    t.string "Hours Lost"
    t.string "Sessions Lost"
    t.string "Work Related"
    t.string "Third Party"
    t.string "Disability Related"
    t.string "Violence Aggression Related"
    t.string "Notifyable Disease"
    t.date "Return To Work Discussion Date"
    t.date "Occupational Health Referral Date"
    t.datetime "Last Update Date"
    t.string "Surgery Related"
    t.string "DH Monitoring"
    t.string "Sickness Reason"
    t.string "3rd Party System Reference"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Absence Attendance ID"], name: "index_absence_records_on_Absence Attendance ID", unique: true
  end

  create_table "person_records", force: :cascade do |t|
    t.string "Record Type"
    t.string "Person ID"
    t.date "Effective Start Date"
    t.date "Effective End Date"
    t.string "Employee Number"
    t.string "Title"
    t.string "Last Name"
    t.string "First Name"
    t.string "Middle Names"
    t.string "Maiden Name"
    t.string "Preferred Name"
    t.string "Previous Last Name"
    t.string "Gender"
    t.date "Date of Birth"
    t.string "National Insurance Number"
    t.string "NHS Unique ID"
    t.date "Hire Date"
    t.date "Actual Termination Date"
    t.string "Termination Reason"
    t.string "Employee Status Flag"
    t.string "WTR Opt Out"
    t.date "WTR Opt Out Date"
    t.string "Ethnic Origin"
    t.string "Country of Birth"
    t.string "Previous Employer"
    t.string "Previous Employer Type"
    t.date "CSD 3 Months"
    t.date "CSD 12 Months"
    t.string "NHS CRS UUID"
    t.string "System Person Type"
    t.string "User Person Type"
    t.string "Office E-mail Address"
    t.date "NHS Start Date"
    t.date "Last Update Date"
    t.string "Disability Flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Person ID", "Effective Start Date", "Effective End Date"], name: "index_person_records_on_Person ID_and_Effective Start Date_and_Effective End Date", unique: true
  end

  create_table "position_records", force: :cascade do |t|
    t.string "Record Type"
    t.string "Position ID"
    t.date "Effective From Date"
    t.date "Effective To Date"
    t.string "Position Number"
    t.string "Position Name"
    t.string "Budgeted FTE"
    t.string "Subjective Code"
    t.string "Job Staff Group"
    t.string "Job Role"
    t.string "Occupation Code"
    t.string "Payscale"
    t.string "Grade Step"
    t.string "ISA Regulated Post"
    t.string "Organisation ID"
    t.string "Hiring Status"
    t.string "Position Type"
    t.string "Workplace Org Code"
    t.datetime "Last Update Date"
    t.string "Subjective Code Description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Position ID", "Effective From Date", "Effective To Date"], name: "index_position_records_on_Position ID_and_Effective From Date_and_Effective To Date", unique: true
  end

end
