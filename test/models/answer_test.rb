# == Schema Information
#
# Table name: answers
#
#  id           :integer          not null, primary key
#  answer       :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  question_id  :integer
#  applicant_id :integer
#

require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
