# frozen_string_literal: true

class AddPointOfContactToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :point_of_contact, :boolean, default: false, null: false
  end
end
