class JobsController < ApplicationController
  def new
  end

  def create
    @job=current_user.jobs.new(job_params)
    @job.save!
  end

  def index
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
