class HomeController < ApplicationController
 
  def index
    if user_signed_in?
      render_dashboard
    else 
      render 'home/index'
    end 
  end


  private 

    def render_dashboard
      if current_user.admin? 
        render 'user/dashboard/admin'
      elsif current_user.employer?
        render 'user/dashboard/employer'
      elsif current_user.applicant?
        render 'user/dashboard/applicant'
      end
    end
        

          
end
