class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_company, only: [:index, :create, :new, :show, :destroy]
  before_action :fetch_job, only: [:show, :destroy]
  

  def new
    @job=current_user.company.jobs.new
  end

  def create
    @job=current_user.company.jobs.new(job_params)
    @job_save_success = @job.save
    
  end

  def show     
    @all_applicants  = @job.applicants.sort_by(&:position)

    @applicants_applied  = @all_applicants.select{|app| app.status == Applicant::Status::APPLIED}
    @applicants_shortlisted  = @all_applicants.select{|app| app.status == Applicant::Status::SHORTLISTED}
    @applicants_screening  = @all_applicants.select{|app| app.status == Applicant::Status::SCREENING}
    @applicants_prehire  = @all_applicants.select{|app| app.status == Applicant::Status::PREHIRE}
    @applicants_offered  = @all_applicants.select{|app| app.status == Applicant::Status::OFFERED}
    @applicants_rejected = @all_applicants.select{|app| app.status == Applicant::Status::REJECTED}

    @applicants_applied_count = @applicants_applied.count
    @applicants_shortlisted_count = @applicants_shortlisted.count
    @applicants_screening_count = @applicants_screening.count
    @applicants_prehire_count = @applicants_prehire.count
    @applicants_offered_count = @applicants_offered.count
    @applicants_rejected_count = @applicants_rejected.count

    @new_applicant = Applicant.new
  end 

  def index 
    @jobs = @company.jobs.all
    @new_job = Job.new
  end

  def destroy     
    @job.delete
    redirect_to company_jobs_path
  end

  def sort_applicants
    applicant_params = params[:applicant_ids]
    applicants = Applicant.where(id: applicant_params.values.flatten.collect(&:to_i)).group_by(&:id)
    applicant_params.each do |column_type, applicant_ids|
      column_type = column_type.to_i
      (0...applicant_ids.length).each do |i|
        applicants[applicant_ids[i].to_i][0].update_attributes(position: i+1, status: column_type)
      end
    end

    render nothing: true
  end


 
  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

  def fetch_job 
    @job = Job.find(params[:id])
  end

  def fetch_company 
    @company = Company.find(params[:company_id])
  end
  
end
