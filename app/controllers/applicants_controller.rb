class ApplicantsController < ApplicationController
  before_action :fetch_job


  def new
    @applicant = @job.applicants.new
  end

  def create 
    @applicant = @job.applicants.new(applicant_params)
    @applicant.save!
    ApplicantsMailer.apply_to(@applicant).deliver
    render 'applicants/partials/confirm_to_apply'

  end 

  def apply 
  end 

  private 

    def applicant_params 
      params.require(:applicant).permit(:name, :email)
    end 

    def fetch_job
      @job = Job.find(params[:job_id])
    end 
end
