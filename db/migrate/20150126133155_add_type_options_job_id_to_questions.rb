class AddTypeOptionsJobIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :type, :integer
    add_column :questions, :options, :text, :default => nil
    add_reference :questions, :job, index: true
    add_foreign_key :questions, :jobs
  end
end
