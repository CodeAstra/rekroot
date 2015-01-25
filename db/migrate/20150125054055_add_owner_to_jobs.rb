class AddOwnerToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :owner, index: true
  end
end
