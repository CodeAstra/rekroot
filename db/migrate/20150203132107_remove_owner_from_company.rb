class RemoveOwnerFromCompany < ActiveRecord::Migration
  def change
    remove_reference :companies, :owner, index: true
    remove_foreign_key :companies, :owners
  end
end
