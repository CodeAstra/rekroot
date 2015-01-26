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
#  gender     :string
#  photo      :string
#  phone      :integer
#  job_id     :integer
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

  belongs_to :job
  has_many :answers 
  validates :job_id, presence: true
  validates :email, presence: true, format: { with: Devise::email_regexp}
  
end
