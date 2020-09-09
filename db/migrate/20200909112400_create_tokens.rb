# frozen_string_literal: true

class CreateTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :tokens do |t|
      t.string :token_ciphertext, null: false
      t.references :created_by
      t.timestamps null: false
    end

    add_index :tokens, :token_ciphertext, unique: true
  end
end
