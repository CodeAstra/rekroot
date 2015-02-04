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
#

class Applicant < ActiveRecord::Base
  belongs_to :job
  validates :job_id, presence: true
  validates :email, presence: true, format: { with: Devise::email_regexp}
  

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
    PRE_HIRE_SHORTLIST = 4
    OFFERED = 5
    ARCHIVED = 6
    REJECTED = 7


    def self.all
      [APPLIED, SHORTLISTED, SCREENING, PRE_HIRE_SHORTLIST, OFFERED, ARCHIVED, REJECTED]
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
    return status == Status::PRE_HIRE_SHORTLIST 
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
