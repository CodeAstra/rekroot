class AddUserToActivity < ActiveRecord::Migration
  def change
    add_reference :activities, :user, index: true
    add_foreign_key :activities, :users
  end
end
