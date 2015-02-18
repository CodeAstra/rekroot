# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  question      :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  question_type :integer          default("1")
#  options       :text
#  job_id        :integer
#  mandatory     :boolean          default("f")
#

class Question < ActiveRecord::Base
  belongs_to :job
  has_many :answers
end
