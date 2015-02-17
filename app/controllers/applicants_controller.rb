class ApplicantsController < ApplicationController

  before_action :fetch_company, :fetch_job

  def new
    @applicant = @job.applicants.new
  end

  def create 
    @applicant=@job.applicants.new(applicant_params)     
    @applicant.save
    redirect_to company_job_path(@company, @job)  
  end 

  def index 
  end 


  def show 
  end

  private 

    def applicant_params 
      params.require(:applicant).permit(:name, :email)
    end 

    def fetch_job
      @job = @company.jobs.find(params[:job_id])
    end 

    def fetch_company 
      @company = Company.find(params[:company_id])
    end

    def applicant_params
      params.require(:applicant).permit(:name, :email)
    end
end
