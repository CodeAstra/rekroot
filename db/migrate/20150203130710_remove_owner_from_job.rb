class RemoveOwnerFromJob < ActiveRecord::Migration
  def change
    remove_column :jobs, :owner_id, :string
  end
end
