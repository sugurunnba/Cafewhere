class AddUserStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_status, :boolean, default: false, null: false
  end
end
