class ChangeTypeInUser < ActiveRecord::Migration
  def change
    change_column :users, :type, :integer, default: 2
  end
end
