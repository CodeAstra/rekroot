# == Schema Information
#
# Table name: answers
#
#  id         :integer          not null, primary key
#  answer     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Answer < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :question
end
