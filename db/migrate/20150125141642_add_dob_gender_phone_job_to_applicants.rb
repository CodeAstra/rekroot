class AddDobGenderPhoneJobToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :dob, :date
    add_column :applicants, :gender, :integer
    add_column :applicants, :phone, :string
    add_reference :applicants, :job, index: true
    add_foreign_key :applicants, :jobs
  end
end
