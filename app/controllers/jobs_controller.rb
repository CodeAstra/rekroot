class JobsController < ApplicationController
  

  def new
    
  end

  def create
    @job=Job.new(job_params)
    @job.save!
  end

  def apply

  end 


  def show 
    @job = Job.find(params[:id])
  end 


  private
  def job_params
    params.require(:job).permit(:title, :description)
  end
end
