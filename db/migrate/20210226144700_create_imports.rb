# frozen_string_literal: true

class CreateImports < ActiveRecord::Migration[6.0]
  def change
    create_table :imports do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
