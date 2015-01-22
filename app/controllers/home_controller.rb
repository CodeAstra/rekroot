class HomeController < ApplicationController
  def index
    if user_signed_in?
      logged_in
    else 
      render 'home/index'
    end 
  end


  private 

    def logged_in 
      if current_user.admin? 
        render 'user/dashboard/admin'
      elsif current_user.employer?
        render 'user/dashboard/employer'
      else
        render 'user/dashboard/applicant'
      end
        

          
end
