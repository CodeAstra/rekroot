# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :integer
#  options    :text
#  job_id     :integer
#

class Question < ActiveRecord::Base
  module Type 
    TEXT = 1 
    MCQ_RADIO  = 2
    MCQ_CHKBOX = 3 
    UPLOAD = 4

    def self.all
      [TEXT, MCQ_RADIO,MCQ_CHKBOX,UPLOAD]
    end
  end

  belongs_to :job
  has_many :answers


  validates :type, presence: true, 
            numericality: { only_integer: true }, inclusion: { in: Type.all}

  def text?
    return type == Type::TEXT 
  end 

  def mcq_radio?
    return type == Type::MCQ_RADIO
  end

  def mcq_chkbox?
    return type == Type::MCQ_CHKBOX
  end

  def upload?
    return type == Type::UPLOAD
  end
end
