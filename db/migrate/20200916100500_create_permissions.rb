# frozen_string_literal: true

class CreatePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permissions do |t|
      t.references :subject, polymorphic: true
      t.string :resource, null: false
      t.string :action, null: false
      t.string :columns, null: false
      t.timestamps null: false
    end

    # There should only ever be one Permission per subject:resource:action.
    add_index :permissions, [:subject_id, :resource, :action], unique: true
  end
end
