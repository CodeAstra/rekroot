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
#  user_id      :integer
#

class Activity < ActiveRecord::Base

after_create :update_from_status_and_user_id

  belongs_to :applicant
  belongs_to :user

  scope :reverse_chron, -> {order('created_at DESC')}

  def update_from_status_and_user_id 
    self.update_attributes(fromstatus: fetch_from_status, user_id: update_user_id)
  end

  def update_user_id
    return User.current.id
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
