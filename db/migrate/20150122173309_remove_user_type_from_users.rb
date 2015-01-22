class RemoveUserTypeFromUsers < ActiveRecord::Migration
  def change
     remove_column :users, :user_type, :integer,default: User::Role::EMPLOYER
  end
end
