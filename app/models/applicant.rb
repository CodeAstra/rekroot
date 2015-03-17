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
#  phone      :string
#  job_id     :integer
#  confirm    :boolean          default("f")
#  status     :integer          default("1")
#  position   :integer          default("1")
#

class Applicant < ActiveRecord::Base

  module Status 
    APPLIED = 1 
    SHORTLISTED  = 2
    SCREENING = 3
    PREHIRE = 4
    OFFERED = 5
    ARCHIVED = 6
    REJECTED = 7

    # def self.all
    #   [APPLIED, SHORTLISTED, SCREENING, PREHIRE, OFFERED, ARCHIVED, REJECTED]
    # end
  end

  belongs_to :job
  has_many :comments
  has_many :activities
  has_many :applicantfiles
  validates :job_id, presence: true
  validates :email, presence: true, format: { with: Devise::email_regexp}

  after_create :create_first_activity_after
  after_update :create_activity_after

  def create_first_activity_after
    activities.create(tostatus: status)
  end

  def create_activity_after 
    activities.create(tostatus: status) if status_changed?
  end 

end
