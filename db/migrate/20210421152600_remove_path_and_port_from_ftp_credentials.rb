class RemovePathAndPortFromFtpCredentials < ActiveRecord::Migration[6.0]
  def change
    remove_index :ftp_credentials, name: :index_ftp_credentials_on_path_ciphertext
    remove_column :ftp_credentials, :path_ciphertext
    remove_index :ftp_credentials, name: :index_ftp_credentials_on_port_ciphertext
    remove_column :ftp_credentials, :port_ciphertext
  end
end

