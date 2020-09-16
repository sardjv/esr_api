# frozen_string_literal: true

class CreateTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :tokens do |t|
      t.string :name, null: false
      t.string :token_ciphertext, null: false
      t.timestamp :token_viewed_at
      t.references :created_by
      t.timestamps null: false
    end

    add_index :tokens, :token_ciphertext, unique: true
    add_index :tokens, [:name, :created_by_id], unique: true
  end
end
