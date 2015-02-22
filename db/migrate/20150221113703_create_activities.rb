class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :applicant, index: true
      t.integer :fromstatus, :default => 0
      t.integer :tostatus, :default => 0

      t.timestamps null: false
    end
    add_foreign_key :activities, :applicants
  end
end
