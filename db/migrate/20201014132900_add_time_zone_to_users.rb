# frozen_string_literal: true

class AddTimeZoneToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :time_zone, :string, default: 'London', null: false
  end
end
