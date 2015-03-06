class RemovePwdigestFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password_digest, :string, limit: 255
  end
end
