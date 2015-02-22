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
#  status     :integer          default("1")
#  position   :integer          default("1")
#

class Applicant < ActiveRecord::Base


  module Gender
    MALE = 0
    FEMALE = 1
    OTHER = 2
    
    DESCRIPTION = {
      MALE => "Male",
      FEMALE => "Female",
      OTHER => "Other"
    }

    def self.all
      [MALE, FEMALE, OTHER]
    end

    def self.all_pairs
      all.collect{|grp| grp = DESCRIPTION[grp]}      
    end
  end


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

  belongs_to :job
  has_many :comments
  has_many :activities
  validates :job_id, presence: true
  validates :email, presence: true, format: { with: Devise::email_regexp}


  # before_update :create_activity_before
  after_update :create_activity_after

  def create_activity_after
    Activity.create(applicant_id: self.id, tostatus: self.status) if self.status_changed? 
  end 

  # def check_activity_presence? 
  #   return true if Activity.where(:applicant_id=> self.id).nil?
  # end 
  # def create_activity_after 
  #   activity.update_attributes(tostatus: self.status)
  # end 

  # def activity 
  #   return Activity.where(["applicant_id = ? and  tostatus =?", self.id, "0"]).last
  # end 

  # def from_status 
  #   return Activity.where(["applicant_id = ?", self.id]).order("id DESC").offset(1).status
  # end


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

end