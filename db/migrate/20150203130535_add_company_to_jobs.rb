class AddCompanyToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :company, index: true
    add_foreign_key :jobs, :companies
  end
end
