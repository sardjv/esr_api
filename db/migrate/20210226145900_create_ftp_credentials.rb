# frozen_string_literal: true

class CreateFtpCredentials < ActiveRecord::Migration[6.0]
  def change
    create_table :ftp_credentials do |t|
      t.string :name, null: false
      t.string :host_ciphertext, null: false
      t.string :port_ciphertext, null: false
      t.string :user_ciphertext, null: false
      t.string :password_ciphertext, null: false
      t.string :path_ciphertext, null: false
      t.references :created_by

      t.timestamps null: false
    end

    add_index :ftp_credentials, :name, unique: true
    add_index :ftp_credentials, :host_ciphertext, unique: true
    add_index :ftp_credentials, :port_ciphertext, unique: true
    add_index :ftp_credentials, :user_ciphertext, unique: true
    add_index :ftp_credentials, :password_ciphertext, unique: true
    add_index :ftp_credentials, :path_ciphertext, unique: true
  end
end
