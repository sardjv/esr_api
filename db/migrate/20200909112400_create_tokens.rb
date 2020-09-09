# frozen_string_literal: true

class CreateTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :tokens do |t|
      t.string :encrypted_token, null: false
      t.references :created_by
      t.timestamps null: false
    end

    add_index :tokens, :encrypted_token, unique: true
  end
end
