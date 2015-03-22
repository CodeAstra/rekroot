# == Schema Information
#
# Table name: applicantfiles
#
#  id           :integer          not null, primary key
#  file         :string
#  applicant_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Applicantfile < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :user
  scope :reverse_chron, -> {order('created_at DESC')}

  mount_uploader :file, ApplicantfileUploader
end
