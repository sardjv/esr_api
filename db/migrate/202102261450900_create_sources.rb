# frozen_string_literal: true

class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.string :name, null: false
      t.string :source_ciphertext, null: false
      t.references :created_by

      t.timestamps null: false
    end

    add_index :sources, :source_ciphertext, unique: true
    add_index :sources, :name, unique: true

    add_column :sources, :source_bidx, :string
    add_index :sources, :source_bidx, unique: true
  end
end
