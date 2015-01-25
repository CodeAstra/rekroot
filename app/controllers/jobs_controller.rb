class JobsController < ApplicationController
  

  def new
  end

  def create

    @job=current_user.jobs.new(job_params)\
    @job.save!
    redirect_to job_show_path(@job.id)
  end


  def apply
    @job = Job.find(params[:id])
  end 


  def show 
    @job = Job.find(params[:id])
  end 

  def index
  end


  private

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
