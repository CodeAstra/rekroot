class CompaniesController < ApplicationController

  def new 
    @company = Company.new
  end 

  def create 
    @company=Company.new(company_params)
    @company.save
    current_user.update_attribute(:company_id, @company.id)
    redirect_to company_jobs_path(@company)
  end 


  private

  def company_params
    params.require(:company).permit(:name, :website)
  end

end
