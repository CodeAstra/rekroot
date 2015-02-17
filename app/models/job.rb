# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :integer
#

class Job < ActiveRecord::Base
  belongs_to :company
  validates :title, presence: true, length: {maximum: 140}
  has_many :applicants
  has_many :questions
end
