class JobsController < ApplicationController
  before_action :fetch_job, only: [:show, :apply]

  def new
     @job=current_user.jobs.new
  end

  def create

    @job=current_user.jobs.new(job_params)
    if @job.save 
      redirect_to job_path(@job.id)
    else 
      render 'new'
    end
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

  class ProductsController
    def action
      @applicant = Applicant.save(params["applicant_id"])
      redirect_to user_url(@user.id)
    end
  end



end
