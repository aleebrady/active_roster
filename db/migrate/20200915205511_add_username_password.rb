class AddUsernamePassword < ActiveRecord::Migration
  def change
    add_column :teams, :username, :string
    add_column :teams, :password_digest, :string
  end
end
