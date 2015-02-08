class AddUserIdApplicantIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :user, index: true
    add_foreign_key :comments, :users
    add_reference :comments, :applicant, index: true
    add_foreign_key :comments, :applicants
  end
end
