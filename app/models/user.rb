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

  validates :type, presence: true, 
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
