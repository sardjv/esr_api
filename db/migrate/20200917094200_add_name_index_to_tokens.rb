# frozen_string_literal: true

class AddNameIndexToTokens < ActiveRecord::Migration[6.0]
  def change
    remove_index :tokens, [:name, :created_by_id]
    add_index :tokens, :name, unique: true
  end
end
