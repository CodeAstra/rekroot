class AddFromstatusToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :fromstatus, :integer, default: 0
  end
end
