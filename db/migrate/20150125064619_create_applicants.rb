class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
