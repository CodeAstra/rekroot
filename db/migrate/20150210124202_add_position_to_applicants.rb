class AddPositionToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :position, :integer, default: 1
  end
end
