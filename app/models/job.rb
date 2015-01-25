class Job < ActiveRecord::Base
  belongs_to :owner, class_name: User.name
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 140}
end
