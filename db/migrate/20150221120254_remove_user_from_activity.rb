class RemoveUserFromActivity < ActiveRecord::Migration
  def change
    remove_reference :activities, :user, index: true
    remove_foreign_key :activities, :users
  end
end
