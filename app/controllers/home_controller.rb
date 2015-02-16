class HomeController < ApplicationController
 
  def index 
    if user_signed_in?      
      # render_dashboard
      # render 'companies/new'
    
      if current_user.company.nil?
        redirect_to new_company_path
      else 
        @company = current_user.company
        redirect_to company_jobs_path(@company_id)
      end 

    else 
      render 'home/index'
    end 
  end

  


  # private 

  #   def render_dashboard
  #     if current_user.admin? 
  #       render 'users/dashboard/admin'
  #     elsif current_user.employer?
  #       render 'users/dashboard/employer'
  #     elsif current_user.applicant?
  #       render 'users/dashboard/applicant'
  #     end
    
  #   end   

          
end
