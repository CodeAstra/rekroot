class ApplicantsController < ApplicationController
  before_action :fetch_job


  def new
    @applicant = @job.applicants.new
  end


  private 

    def fetch_job
      @job = Job.find(params[:job_id])
    end 
end
