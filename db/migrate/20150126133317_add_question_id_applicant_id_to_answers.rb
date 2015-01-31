class AddQuestionIdApplicantIdToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :question, index: true
    add_foreign_key :answers, :questions
    add_reference :answers, :applicant, index: true
    add_foreign_key :answers, :applicants
  end
end
