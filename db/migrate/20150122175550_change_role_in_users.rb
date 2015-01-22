class ChangeRoleInUsers < ActiveRecord::Migration
  def change
    change_column :users, :role, :integer, default: User::Role::EMPLOYER
  end
end
