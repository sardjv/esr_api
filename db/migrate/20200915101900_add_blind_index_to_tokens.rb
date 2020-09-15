# frozen_string_literal: true

class AddBlindIndexToTokens < ActiveRecord::Migration[6.0]
  def change
    add_column :tokens, :token_bidx, :string
    add_index :tokens, :token_bidx, unique: true
  end
end
