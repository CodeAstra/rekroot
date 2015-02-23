class CreateApplicantfiles < ActiveRecord::Migration
  def change
    create_table :applicantfiles do |t|
      t.string :file
      t.references :applicant, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :applicantfiles, :applicants
    add_foreign_key :applicantfiles, :users
  end
end
