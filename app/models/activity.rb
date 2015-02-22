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

class Activity < ActiveRecord::Base

after_create :update_from_status 

  belongs_to :applicant
  scope :reverse_chron, -> {order('created_at DESC')}

  def update_from_status 
    self.update_attributes(fromstatus: fetch_from_status)
  end 

  def fetch_from_status 
    id = self.applicant_id 
    if Activity.where(:applicant_id=> id).length < 2
      return 0
    else 
      return Activity.where(:applicant_id=> id).order("created_at DESC")[1].tostatus 
    end 
  end
end
