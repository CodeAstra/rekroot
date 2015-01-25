# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_id    :integer
#

class Job < ActiveRecord::Base
  belongs_to :owner, class_name: User.name
  validates :owner_id, presence: true
  validates :title, presence: true, length: {maximum: 140}

  has_many :applicants
end
