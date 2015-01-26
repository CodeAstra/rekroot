# == Schema Information
#
# Table name: applicants
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dob        :date
#  gender     :integer
#  phone      :string
#  job_id     :integer
#  confirm    :boolean          default("f")
#

require 'test_helper'

class ApplicantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
