class ChangeQuestionTypeInQuestions < ActiveRecord::Migration
  def change
    change_column :questions, :question, :text
    add_column :questions, :mandatory, :boolean, :default => false 
  end
end
