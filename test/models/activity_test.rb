# == Schema Information
#
# Table name: activities
#
#  id           :integer          not null, primary key
#  applicant_id :integer
#  tostatus     :integer          default("0")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  fromstatus   :integer          default("0")
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
