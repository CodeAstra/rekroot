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

  module Status 
    APPLIED = 1 
    SHORTLISTED  = 2
    SCREENING = 3
    PREHIRE = 4
    OFFERED = 5
    ARCHIVED = 6
    REJECTED = 7


    def self.all
      [APPLIED, SHORTLISTED, SCREENING, PREHIRE, OFFERED, ARCHIVED, REJECTED]
    end
  end

  def applied?
    return status == Status::APPLIED 
  end 

  def shortlisted?
    return status == Status::SHORTLISTED
  end

  def screening?
    return status == Status::SCREENING
  end

  def pre_hire?
    return status == Status::PREHIRE 
  end 

  def offered?
    return status == Status::OFFERED
  end

  def archived?
    return status == Status::ARCHIVED
  end

  def rejected?
    return status == Status::REJECTED
  end
  
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
