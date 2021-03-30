class AddVpdNumberToFtpCredentials < ActiveRecord::Migration[6.1]
  def change
    add_column :ftp_credentials, :virtual_private_database_number_ciphertext, :string, null: false
  end
end
