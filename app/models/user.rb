# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default("")
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime
#  updated_at             :datetime
#  role                   :integer          default("2")
#  company_id             :integer
#  name                   :string
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string
#  invitations_count      :integer          default("0")
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  
  belongs_to :company
  has_many :comments
  
  module Role 
    ADMIN = 1 
    EMPLOYER  = 2
    APPLICANT = 3

    def self.all
      [ADMIN, EMPLOYER, APPLICANT]
    end
  end

  validates :role, presence: true, 
            numericality: { only_integer: true }, inclusion: { in: Role.all}

  def admin?
    return role == Role::ADMIN 
  end 

  def employer?
    return role == Role::EMPLOYER
  end


  def applicant?
    return role == Role::APPLICANT
  end

  def accept_invitation
    super
    self.company = self.invited_by.company
    
  end

end
