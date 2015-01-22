class AddTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :number, default: 2
  end
end
