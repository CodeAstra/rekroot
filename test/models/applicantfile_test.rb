# == Schema Information
#
# Table name: applicantfiles
#
#  id           :integer          not null, primary key
#  file         :string
#  applicant_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ApplicantfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  validated :file, presence: true
end
