class RemoveFromstatusFromActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :fromstatus, :integer
  end
end
