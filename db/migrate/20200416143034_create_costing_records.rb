class CreateCostingRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :costing_records do |t|
      t.string 'Person ID'
      t.string 'Assignment ID'
      t.string 'Costing Allocation ID'
      t.date 'Effective Start Date'
      t.date 'Effective End Date'
      t.string 'Entity Code'
      t.string 'Charitable Indicator'
      t.string 'Cost Centre'
      t.string 'Subjective'
      t.string 'Analysis 1'
      t.string 'Analysis 2'
      t.string 'Element Number'
      t.string 'Spare Segment'
      t.string 'Percentage Split'
      t.timestamp 'Last Update Date'

      t.timestamps
    end

    add_index :costing_records, ['Costing Allocation ID'], unique: true
  end
end

