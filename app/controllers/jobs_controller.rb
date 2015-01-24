class JobsController < ApplicationController
  def new
    
  end
  def create
    @job=Job.new
    @job.save!
  end
  private
  def job_params

  end
end
