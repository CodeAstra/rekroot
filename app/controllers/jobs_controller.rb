class JobsController < ApplicationController
  before_action :fetch_job, only: [:show, :apply]

  def new
  end

  def create

    @job=current_user.jobs.new(job_params)
    @job.save!
    redirect_to job_path(@job.id)
  end


  def apply
    
  end 


  def show 
    
  end 

  def index
    
  end


 
  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

   def fetch_job 
    @job = Job.find(params[:id])
  end



end
