class AddOwnerToCompany < ActiveRecord::Migration
  def change
    add_reference :companies, :owner, index: true
    add_foreign_key :companies, :owners
  end
end
