class ApplicantfilesController < ApplicationController

  before_action :fetch_company, :fetch_job, :fetch_applicant

  def new 
    @applicantfile = @applicant.applicantfiles.new
  end 

  def create 
    @applicantfile = @applicant.applicantfiles.new(applicantfile_params)
    @applicantfile_save = @applicantfile.save 
    @applicantfile.update_attributes(user_id: current_user.id)    
  end 

  
  def fetch_job
    @job = @company.jobs.find(params[:job_id])
  end 

  def fetch_company 
    @company = Company.find(params[:company_id])
  end

  def fetch_applicant
    @applicant = @job.applicants.find(params[:applicant_id])
  end

  def applicantfile_params
    params.require(:applicantfile).permit(:file)
  end 


end
