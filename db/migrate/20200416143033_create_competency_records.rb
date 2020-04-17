class CreateCompetencyRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :competency_records do |t|
      t.string 'Person ID'
      t.string 'Competency Element ID'
      t.string 'Competency Type'
      t.string 'Competency Status'
      t.string 'Competency Name'
      t.date 'Date From'
      t.date 'Date To'
      t.string 'Proficiency Level'
      t.string 'VPD Code'
      t.date 'Certification Date'
      t.string 'Certification Method'
      t.date 'Next Certification Date'
      t.string 'Competence ID'
      t.string 'Business Group ID'
      t.string 'Job ID'
      t.string 'Organisation ID'
      t.string 'Position ID'
      t.string 'Proficiency Level ID'
      t.string 'Proficiency High Level ID'
      t.string 'Essential Flag'
      t.string 'Records Type'
      t.timestamp 'Last Update Date'

      t.timestamps
    end

    add_index :competency_records, ['Competency Element ID'], unique: true
  end
end

