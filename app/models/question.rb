class Question < ActiveRecord::Base
  belongs_to :job
  has_many :answers
end
