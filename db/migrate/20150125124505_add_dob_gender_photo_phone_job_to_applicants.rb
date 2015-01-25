class AddDobGenderPhotoPhoneJobToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :dob, :date
    add_column :applicants, :gender, :char
    add_column :applicants, :photo, :string
    add_column :applicants, :phone, :integer
    add_reference :applicants, :job, index: true
    add_foreign_key :applicants, :jobs
  end
end
