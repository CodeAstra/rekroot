class AddStatusToApplicant < ActiveRecord::Migration
  def change
    add_column :applicants, :status, :integer, :default => 1
  end
end
