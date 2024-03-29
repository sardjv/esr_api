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

ActiveRecord::Schema.define(version: 2021_04_21_152600) do

  create_table "absence_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
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
    t.string "Notifiable Disease"
    t.date "Return To Work Discussion Date"
    t.date "Occupational Health Referral Date"
    t.timestamp "Last Update Date"
    t.string "Surgery Related"
    t.string "DH Monitoring"
    t.string "Sickness Reason"
    t.string "3rd Party System Reference"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Absence Attendance ID"], name: "index_absence_records_on_Absence Attendance ID", unique: true
  end

  create_table "activities", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "key"
    t.text "parameters"
    t.string "recipient_type"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["owner_type", "owner_id"], name: "index_activities_on_owner"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["recipient_type", "recipient_id"], name: "index_activities_on_recipient"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable"
  end

  create_table "assignment_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "Person ID"
    t.string "Assignment ID"
    t.date "Effective Start Date"
    t.date "Effective End Date"
    t.date "Earliest Assignment Start Date"
    t.string "Assignment Type"
    t.string "Assignment Number"
    t.string "System Assignment Status"
    t.string "User Assignment Status"
    t.string "Employee Status Flag"
    t.string "Payroll Name"
    t.string "Payroll Period Type"
    t.string "Assignment Location ID"
    t.string "Supervisor Flag"
    t.string "Supervisor Person ID"
    t.string "Supervisor Assignment ID"
    t.string "Supervisor Assignment Number"
    t.string "Department Manager Person ID"
    t.string "Employee Category"
    t.string "Assignment Category"
    t.string "Primary Assignment"
    t.string "Normal Hours / Sessions"
    t.string "Frequency"
    t.string "Grade Contract Hours"
    t.string "FTE"
    t.string "Flexible Working Pattern"
    t.string "Organisation ID"
    t.string "Position ID"
    t.string "Position Name"
    t.string "Grade"
    t.string "Grade Step"
    t.date "Start Date in Grade"
    t.string "Annual Salary Value"
    t.string "Job Name"
    t.string "People Group"
    t.string "T&A Flag"
    t.string "Assignment Night Worker Attribute"
    t.date "Projected Hire Date"
    t.string "Vacancy ID"
    t.date "Contract End Date"
    t.date "Increment Date"
    t.string "Maximum Part Time Flag"
    t.string "AFC Flag"
    t.timestamp "Last Update Date"
    t.date "Last Working Day"
    t.string "e-KSF Spinal Point"
    t.string "Manager Flag"
    t.date "Assignment End Date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Assignment ID", "Effective Start Date", "Effective End Date"], name: "index_assignment_effective_start_and_end_date", unique: true
  end

  create_table "competence_definition_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "Competence ID"
    t.string "Competence Name"
    t.string "Description"
    t.date "Date From"
    t.date "Date To"
    t.string "Behavioural Indicator"
    t.string "Certification Required"
    t.string "Rating Scale ID"
    t.string "Evaluation Method"
    t.string "Renewal Period Freq"
    t.string "Renewal Period Units"
    t.string "Competence Cluster"
    t.string "Competence Alias"
    t.string "VPD Code"
    t.timestamp "Last Update Date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Competence ID"], name: "index_competence_definition_records_on_Competence ID", unique: true
  end

  create_table "competency_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "Person ID"
    t.string "Competency Element ID"
    t.string "Competency Type"
    t.string "Competency Status"
    t.string "Competency Name"
    t.date "Date From"
    t.date "Date To"
    t.string "Proficiency Level"
    t.string "VPD Code"
    t.date "Certification Date"
    t.string "Certification Method"
    t.date "Next Certification Date"
    t.string "Competence ID"
    t.string "Business Group ID"
    t.string "Job ID"
    t.string "Organisation ID"
    t.string "Position ID"
    t.string "Proficiency Level ID"
    t.string "Proficiency High Level ID"
    t.string "Essential Flag"
    t.string "Records Type"
    t.timestamp "Last Update Date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Competency Element ID"], name: "index_competency_records_on_Competency Element ID", unique: true
  end

  create_table "costing_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "Person ID"
    t.string "Assignment ID"
    t.string "Costing Allocation ID"
    t.date "Effective Start Date"
    t.date "Effective End Date"
    t.string "Entity Code"
    t.string "Charitable Indicator"
    t.string "Cost Centre"
    t.string "Subjective"
    t.string "Analysis 1"
    t.string "Analysis 2"
    t.string "Element Number"
    t.string "Spare Segment"
    t.string "Percentage Split"
    t.timestamp "Last Update Date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Costing Allocation ID"], name: "index_costing_records_on_Costing Allocation ID", unique: true
  end

  create_table "disability_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "Person ID"
    t.string "Disability ID"
    t.string "Category"
    t.string "Status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Disability ID"], name: "index_disability_records_on_Disability ID", unique: true
  end

  create_table "element_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "Person ID"
    t.string "Element Entry ID"
    t.date "Effective Start Date"
    t.date "Effective End Date"
    t.string "Element Entry Type"
    t.string "Assignment ID"
    t.string "Element Type ID"
    t.string "Element Type Name"
    t.date "Earned Date"
    t.string "Entry Value 1"
    t.string "Entry Value 2"
    t.string "Entry Value 3"
    t.string "Entry Value 4"
    t.string "Entry Value 5"
    t.string "Entry Value 6"
    t.string "Entry Value 7"
    t.string "Entry Value 8"
    t.string "Entry Value 9"
    t.string "Entry Value 10"
    t.string "Entry Value 11"
    t.string "Entry Value 12"
    t.string "Entry Value 13"
    t.string "Entry Value 14"
    t.string "Entry Value 15"
    t.timestamp "Last Update Date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Element Entry ID"], name: "index_element_records_on_Element Entry ID", unique: true
  end

  create_table "ftp_credentials", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", null: false
    t.string "host_ciphertext", null: false
    t.string "user_ciphertext", null: false
    t.string "password_ciphertext", null: false
    t.bigint "created_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "virtual_private_database_number_ciphertext", null: false
    t.index ["created_by_id"], name: "index_ftp_credentials_on_created_by_id"
    t.index ["host_ciphertext"], name: "index_ftp_credentials_on_host_ciphertext", unique: true
    t.index ["name"], name: "index_ftp_credentials_on_name", unique: true
    t.index ["password_ciphertext"], name: "index_ftp_credentials_on_password_ciphertext", unique: true
    t.index ["user_ciphertext"], name: "index_ftp_credentials_on_user_ciphertext", unique: true
  end

  create_table "location_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "Record Type"
    t.string "Location ID"
    t.string "Location Code"
    t.string "Location Description"
    t.date "Inactive Date"
    t.string "Assignment Address 1st line"
    t.string "Assignment Address 2nd line"
    t.string "Assignment Address 3rd line"
    t.string "Town"
    t.string "County"
    t.string "Postcode"
    t.string "Country"
    t.string "Telephone"
    t.string "Fax"
    t.string "Payslip Delivery Point"
    t.string "Site Code"
    t.string "Welsh Location Translation"
    t.string "Welsh Address Line 1"
    t.string "Welsh Address Line 2"
    t.string "Welsh Address Line 3"
    t.string "Welsh Town Translation"
    t.timestamp "Last Update Date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Location ID"], name: "index_location_records_on_Location ID", unique: true
  end

  create_table "organisation_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "Organisation ID"
    t.string "Organisation Name"
    t.string "Organisation Type"
    t.date "Effective From Date"
    t.date "Effective To Date"
    t.string "Hierarchy Version ID"
    t.date "Hierarchy Version Date From"
    t.date "Hierarchy Version Date To"
    t.string "Default Cost Centre"
    t.string "Parent Organisation ID"
    t.string "NACS Code"
    t.string "Location ID"
    t.timestamp "Last Update Date"
    t.string "Cost Centre Description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Organisation ID"], name: "index_organisation_records_on_Organisation ID", unique: true
  end

  create_table "permissions", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "subject_type"
    t.bigint "subject_id"
    t.string "resource", null: false
    t.string "action", null: false
    t.text "columns", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id", "resource", "action"], name: "index_permissions_on_subject_id_and_resource_and_action", unique: true
    t.index ["subject_type", "subject_id"], name: "index_permissions_on_subject_type_and_subject_id"
  end

  create_table "person_eit_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "Person ID"
    t.string "Person Extra Information ID"
    t.string "Information Type"
    t.string "PEI_INFORMATION_CATEGORY"
    t.string "PEI_INFORMATION1"
    t.string "PEI_INFORMATION2"
    t.string "PEI_INFORMATION3"
    t.string "PEI_INFORMATION4"
    t.string "PEI_INFORMATION5"
    t.string "PEI_INFORMATION6"
    t.string "PEI_INFORMATION7"
    t.string "PEI_INFORMATION8"
    t.string "PEI_INFORMATION9"
    t.string "PEI_INFORMATION10"
    t.string "PEI_INFORMATION11"
    t.string "PEI_INFORMATION12"
    t.string "PEI_INFORMATION13"
    t.string "PEI_INFORMATION14"
    t.string "PEI_INFORMATION15"
    t.string "PEI_INFORMATION16"
    t.string "PEI_INFORMATION17"
    t.string "PEI_INFORMATION18"
    t.string "PEI_INFORMATION19"
    t.string "PEI_INFORMATION20"
    t.string "PEI_INFORMATION21"
    t.string "PEI_INFORMATION22"
    t.string "PEI_INFORMATION23"
    t.string "PEI_INFORMATION24"
    t.string "PEI_INFORMATION25"
    t.string "PEI_INFORMATION26"
    t.string "PEI_INFORMATION27"
    t.string "PEI_INFORMATION28"
    t.string "PEI_INFORMATION29"
    t.string "PEI_INFORMATION30"
    t.string "ATTRIBUTE_CATEGORY"
    t.string "PEI_ATTRIBUTE1"
    t.string "PEI_ATTRIBUTE2"
    t.string "PEI_ATTRIBUTE3"
    t.string "PEI_ATTRIBUTE4"
    t.string "PEI_ATTRIBUTE5"
    t.string "PEI_ATTRIBUTE6"
    t.string "PEI_ATTRIBUTE7"
    t.string "PEI_ATTRIBUTE8"
    t.string "PEI_ATTRIBUTE9"
    t.string "PEI_ATTRIBUTE10"
    t.string "PEI_ATTRIBUTE11"
    t.string "PEI_ATTRIBUTE12"
    t.string "PEI_ATTRIBUTE13"
    t.string "PEI_ATTRIBUTE14"
    t.string "PEI_ATTRIBUTE15"
    t.string "PEI_ATTRIBUTE16"
    t.string "PEI_ATTRIBUTE17"
    t.string "PEI_ATTRIBUTE18"
    t.string "PEI_ATTRIBUTE19"
    t.string "PEI_ATTRIBUTE20"
    t.timestamp "Last Update Date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Person Extra Information ID"], name: "index_person_eit_records_on_Person Extra Information ID", unique: true
  end

  create_table "person_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
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
    t.index ["Person ID", "Effective Start Date", "Effective End Date"], name: "index_person_records_effective_start_and_end", unique: true
  end

  create_table "position_eit_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "Position ID"
    t.string "Position Extra Information ID"
    t.string "Information Type"
    t.string "POEI_INFORMATION_CATEGORY"
    t.string "POEI_INFORMATION1"
    t.string "POEI_INFORMATION2"
    t.string "POEI_INFORMATION3"
    t.string "POEI_INFORMATION4"
    t.string "POEI_INFORMATION5"
    t.string "POEI_INFORMATION6"
    t.string "POEI_INFORMATION7"
    t.string "POEI_INFORMATION8"
    t.string "POEI_INFORMATION9"
    t.string "POEI_INFORMATION10"
    t.string "POEI_INFORMATION11"
    t.string "POEI_INFORMATION12"
    t.string "POEI_INFORMATION13"
    t.string "POEI_INFORMATION14"
    t.string "POEI_INFORMATION15"
    t.string "POEI_INFORMATION16"
    t.string "POEI_INFORMATION17"
    t.string "POEI_INFORMATION18"
    t.string "POEI_INFORMATION19"
    t.string "POEI_INFORMATION20"
    t.string "POEI_INFORMATION21"
    t.string "POEI_INFORMATION22"
    t.string "POEI_INFORMATION23"
    t.string "POEI_INFORMATION24"
    t.string "POEI_INFORMATION25"
    t.string "POEI_INFORMATION26"
    t.string "POEI_INFORMATION27"
    t.string "POEI_INFORMATION28"
    t.string "POEI_INFORMATION29"
    t.string "POEI_INFORMATION30"
    t.string "ATTRIBUTE_CATEGORY"
    t.string "POEI_ATTRIBUTE1"
    t.string "POEI_ATTRIBUTE2"
    t.string "POEI_ATTRIBUTE3"
    t.string "POEI_ATTRIBUTE4"
    t.string "POEI_ATTRIBUTE5"
    t.string "POEI_ATTRIBUTE6"
    t.string "POEI_ATTRIBUTE7"
    t.string "POEI_ATTRIBUTE8"
    t.string "POEI_ATTRIBUTE9"
    t.string "POEI_ATTRIBUTE10"
    t.string "POEI_ATTRIBUTE11"
    t.string "POEI_ATTRIBUTE12"
    t.string "POEI_ATTRIBUTE13"
    t.string "POEI_ATTRIBUTE14"
    t.string "POEI_ATTRIBUTE15"
    t.string "POEI_ATTRIBUTE16"
    t.string "POEI_ATTRIBUTE17"
    t.string "POEI_ATTRIBUTE18"
    t.string "POEI_ATTRIBUTE19"
    t.string "POEI_ATTRIBUTE20"
    t.timestamp "Last Update Date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Position Extra Information ID"], name: "index_position_eit_records_on_Position Extra Information ID", unique: true
  end

  create_table "position_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
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
    t.timestamp "Last Update Date"
    t.string "Subjective Code Description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Position ID", "Effective From Date", "Effective To Date"], name: "index_position_records_effective_from_and_to", unique: true
  end

  create_table "qualification_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "Person ID"
    t.string "Qualification ID"
    t.string "Qualification Type"
    t.string "Title"
    t.string "Status"
    t.string "Grade"
    t.date "Awarded Date"
    t.date "Start Date"
    t.date "End Date"
    t.string "Establishment"
    t.string "Country"
    t.timestamp "Last Update Date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Qualification ID"], name: "index_qualification_records_on_Qualification ID", unique: true
  end

  create_table "sit_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "Person ID"
    t.string "Special Information ID"
    t.date "Effective Start Date"
    t.date "Effective End Date"
    t.string "Information Type"
    t.string "SEGMENT1"
    t.string "SEGMENT2"
    t.string "SEGMENT3"
    t.string "SEGMENT4"
    t.string "SEGMENT5"
    t.string "SEGMENT6"
    t.string "SEGMENT7"
    t.string "SEGMENT8"
    t.string "SEGMENT9"
    t.string "SEGMENT10"
    t.string "SEGMENT11"
    t.string "SEGMENT12"
    t.string "SEGMENT13"
    t.string "SEGMENT14"
    t.string "SEGMENT15"
    t.string "SEGMENT16"
    t.string "SEGMENT17"
    t.string "SEGMENT18"
    t.string "SEGMENT19"
    t.string "SEGMENT20"
    t.string "SEGMENT21"
    t.string "SEGMENT22"
    t.string "SEGMENT23"
    t.string "SEGMENT24"
    t.string "SEGMENT25"
    t.string "SEGMENT26"
    t.string "SEGMENT27"
    t.string "SEGMENT28"
    t.string "SEGMENT29"
    t.string "SEGMENT30"
    t.string "ATTRIBUTE_CATEGORY"
    t.string "ATTRIBUTE1"
    t.string "ATTRIBUTE2"
    t.string "ATTRIBUTE3"
    t.string "ATTRIBUTE4"
    t.string "ATTRIBUTE5"
    t.string "ATTRIBUTE6"
    t.string "ATTRIBUTE7"
    t.string "ATTRIBUTE8"
    t.string "ATTRIBUTE9"
    t.string "ATTRIBUTE10"
    t.string "ATTRIBUTE11"
    t.string "ATTRIBUTE12"
    t.string "ATTRIBUTE13"
    t.string "ATTRIBUTE14"
    t.string "ATTRIBUTE15"
    t.string "ATTRIBUTE16"
    t.string "ATTRIBUTE17"
    t.string "ATTRIBUTE18"
    t.string "ATTRIBUTE19"
    t.string "ATTRIBUTE20"
    t.timestamp "Last Update Date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Special Information ID"], name: "index_sit_records_on_Special Information ID", unique: true
  end

  create_table "tokens", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", null: false
    t.string "token_ciphertext", null: false
    t.timestamp "token_viewed_at"
    t.bigint "created_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "token_bidx"
    t.index ["created_by_id"], name: "index_tokens_on_created_by_id"
    t.index ["name"], name: "index_tokens_on_name", unique: true
    t.index ["token_bidx"], name: "index_tokens_on_token_bidx", unique: true
    t.index ["token_ciphertext"], name: "index_tokens_on_token_ciphertext", unique: true
  end

  create_table "training_absence_records", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
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
    t.date "Sickness End Date"
    t.string "Absence Duration Days"
    t.string "Absence Duration Hours"
    t.string "Absence Units"
    t.string "Hours Lost"
    t.string "Sessions Lost"
    t.string "Work Related"
    t.string "Third Party"
    t.string "Disability Related"
    t.string "Violence & Aggression Related"
    t.string "Notifiable Disease"
    t.date "Return To Work Discussion Date"
    t.date "Occupational Health Referral Date"
    t.timestamp "Last Update Date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Absence Attendance ID"], name: "index_training_absence_records_on_Absence Attendance ID", unique: true
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.boolean "point_of_contact", default: false, null: false
    t.string "time_zone", default: "London", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "item_type", limit: 191, null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit_type"
    t.string "whodunnit"
    t.text "object", size: :long
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
