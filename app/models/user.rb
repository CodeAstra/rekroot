# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
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
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  

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


end
