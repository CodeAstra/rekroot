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
  belongs_to :job
  validates :job_id, presence: true
  validates :email_id, presence: true, format: { with: Devise::email_regexp}
end
