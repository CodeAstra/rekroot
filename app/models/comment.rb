# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  comment      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  applicant_id :integer
#

class Comment < ActiveRecord::Base

  belongs_to :applicant
  belongs_to :user
  scope :reverse_chron, -> {order('created_at DESC')}
  
end
