class ApplicantsController < ApplicationController
  before_action :fetch_company, :fetch_job



  def new
    @applicant = @job.applicants.new
  end

  def create 
    @applicant=@job.applicants.new(applicant_params)     
    @save_success = @applicant.save     
  end 

  def index 
  end 


  def show 
    @applicant = @job.applicants.find(params[:id])
    @comments = @applicant.comments.reverse_chron.all
    @new_comment = @applicant.comments.new
  end

  def edit 
  end

  def update 
    @applicant = Applicant.find(params[:id])
    @applicant.update_attributes(status_params)  
    redirect_to :back
  end 


  def destroy 
    @applicant = @job.applicants.find(params[:id])
    @applicant.delete
    redirect_to company_job_path(@company, @job) 
  end 


  private 
    def fetch_job
      @job = @company.jobs.find(params[:job_id])
    end 

    def fetch_company 
      @company = Company.find(params[:company_id])
    end

    def applicant_params
      params.require(:applicant).permit(:name, :email)
    end

    def status_params 
      params.require(:applicant).permit(:status)
    end 
end
