class ApplicantsController < ApplicationController
  before_action :fetch_company, :fetch_job
  before_action :fetch_last_positon, only: [:create]

  def new
    @applicant = @job.applicants.new
  end

  def create 
    @applicant=@job.applicants.new(applicant_params)     
    @save_success = @applicant.save    
    @applicant.update_attributes(position: @last_position+1)
    @user=current_user
    Activity.create(applicant_id: @applicant.id, tostatus: @applicant.status)
  end 

  def index 
  end 


  def show 
    @applicant = @job.applicants.find(params[:id])
    @comments = @applicant.comments.reverse_chron.all
    @new_comment = @applicant.comments.new
    @user = current_user
    @activities = @applicant.activities.reverse_chron.all  
    @applicantfile = @applicant.applicantfiles.new    
    @applicantfiles = @applicant.applicantfiles.reverse_chron.all  
  end

  def edit 
  end

  def update 
    @applicant = Applicant.find(params[:id])
    @applicant.update_attributes(status_params)  
  end 


  def destroy 
    @applicant = @job.applicants.find(params[:id])
    @applicant.delete
    redirect_to company_job_path(@company, @job) 
  end 


  private 

    def fetch_job
      @job = @company.jobs.find(params[:job_id])
    end 

    def fetch_company 
      @company = Company.find(params[:company_id])
    end

    def fetch_last_positon
      @last_position = @job.applicants.where(status: 1).count + 1
    end 

    def applicant_params
      params.require(:applicant).permit(:name, :email)
    end

    def status_params 
      params.require(:applicant).permit(:status)
    end 
end
