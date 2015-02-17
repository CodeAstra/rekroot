class HomeController < ApplicationController
 
  def index 
    if user_signed_in?    
        
      if current_user.company.nil?
        redirect_to new_company_path
      else 
        @company = current_user.company
        redirect_to company_jobs_path(@company)
      end 

    else 
      render 'home/index'
    end 
  end          
end
