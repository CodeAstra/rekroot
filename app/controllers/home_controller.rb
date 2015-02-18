class HomeController < ApplicationController
 
  def index 
    if user_signed_in? 
      if current_company
      redirect_to company_jobs_path(current_company)
      else
      redirect_to new_company_path
      end
    else 
      render 'home/index'
    end 
  end          
end