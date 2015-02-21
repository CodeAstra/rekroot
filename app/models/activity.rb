# == Schema Information
#
# Table name: activities
#
#  id           :integer          not null, primary key
#  applicant_id :integer
#  fromstatus   :integer          default("0")
#  tostatus     :integer          default("0")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Activity < ActiveRecord::Base
  
  belongs_to :applicant
end
