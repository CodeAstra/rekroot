class AddConfirmToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :confirm, :boolean, :default => false
  end
end
