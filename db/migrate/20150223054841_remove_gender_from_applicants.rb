class RemoveGenderFromApplicants < ActiveRecord::Migration
  def change
    remove_column :applicants, :gender, :integer
  end
end
