class CompaniesController < ApplicationController

  def new 
    @company = Company.new
  end 

  def create 
    @company=Company.new(company_params)
    @company.save
    redirect_to company_jobs_path(@company)
  end 


  private

  def company_params
    params.require(:company).permit(:name, :website)
  end

end
