class CreateCompetenceDefinitionRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :competence_definition_records do |t|
      t.string 'Record Type'
      t.string 'Competence ID'
      t.string 'Competence Name'
      t.string 'Description'
      t.date 'Date From'
      t.date 'Date To'
      t.string 'Behavioural Indicator'
      t.string 'Certification Required'
      t.string 'Rating Scale ID'
      t.string 'Evaluation Method'
      t.string 'Renewal Period Freq'
      t.string 'Renewal Period Units'
      t.string 'Competence Cluster'
      t.string 'Competence Alias'
      t.string 'VPD Code'
      t.timestamp 'Last Update Date'

      t.timestamps
    end

    add_index :competence_definition_records, ['Competence ID'], unique: true
  end
end

