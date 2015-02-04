class JobsController < ApplicationController
  before_action :fetch_job, only: [:show]
  before_action :fetch_company, only: [:index, :show]

  def new
     @job=current_user.company.jobs.new
  end

  def create
    @job=current_user.company.jobs.new(job_params)
    if @job.save 
      redirect_to job_path(@job.id)
    else 
      render 'new'
    end
  end

  def show 
  end 

  def index    
    @jobs = @company.jobs.all
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
