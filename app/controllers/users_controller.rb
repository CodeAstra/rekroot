class UsersController < ApplicationController
before_action :authenticate_user!
  
  def index 

    if user_signed_in?
      # render_dashboard
      render html: '<b>html goes here<b/>'.html_safe
    else 
      # render 'home/index'
      render html: '<b>html goes here<b/>'.html_safe
    end 
  end

  def create 
    @user = User.new
    render_dashboard
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
