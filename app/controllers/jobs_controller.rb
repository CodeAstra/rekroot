class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_company, only: [:index, :show, :destroy]
  before_action :fetch_job, only: [:show, :destroy]
  

  def new
    @job=current_user.company.jobs.new
  end

  def create
    @job=current_user.company.jobs.new(job_params)
    if @job.save 
      redirect_to company_jobs_path
    else 
      render 'new'
    end
  end

  def show     
    @applicants  = @job.applicants
    @applicants_applied  = @job.applicants.where(status: 1)
    @applicants_shortlisted  = @job.applicants.where(status: 2)
    @applicants_screening  = @job.applicants.where(status: 3)
    @applicants_prehire  = @job.applicants.where(status: 4)
    @applicants_offered  = @job.applicants.where(status: 5)
    @comments = Comment.reverse_chron.where(applicant_id: @applicants.pluck(:id)).group_by(&:applicant_id)
    @new_comment = Comment.new
    @new_applicant = Applicant.new
  end 

  def index 
    @jobs = @company.jobs.all
  end

  def destroy     
    @job.delete
    redirect_to company_jobs_path
  end 


 
  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

  def fetch_job 
    @job = Job.find(params[:id])
  end

  def fetch_company 
    @company = Company.find(params[:company_id])
  end
  
end
