class RemoveStatusFromApplicants < ActiveRecord::Migration
  def change
    remove_column :applicants, :status, :integer
  end
end
