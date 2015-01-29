class JobsController < ApplicationController
  before_action :fetch_job, only: [:show, :edit]

  def new
     @job=current_user.jobs.new
  end

  def create
    @job=current_user.jobs.new(job_params)
    if @job.save 
      redirect_to edit_job_path(@job.id)
    else 
      render 'new'
    end
  end

  def edit
    
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
