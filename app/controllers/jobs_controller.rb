class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_company, only: [:index, :show, :destroy]
  before_action :fetch_job, only: [:show, :destroy]
  

  def new
    @job=current_user.company.jobs.new
  end

  def create
    @job=current_user.company.jobs.new(job_params)
    if @job.save 
      redirect_to company_jobs_path
    else 
      render 'new'
    end
  end

  def show     
    @all_applicants  = @job.applicants.sort_by(&:position)

    @applicants_applied  = @all_applicants.select{|app| app.status == 1}
    @applicants_shortlisted  = @all_applicants.select{|app| app.status == 2}
    @applicants_screening  = @all_applicants.select{|app| app.status == 3}
    @applicants_prehire  = @all_applicants.select{|app| app.status == 4}
    @applicants_offered  = @all_applicants.select{|app| app.status == 5}

    @applicants_applied_count = @applicants_applied.count
    @applicants_shortlisted_count = @applicants_shortlisted.count
    @applicants_screening_count = @applicants_screening.count
    @applicants_prehire_count = @applicants_prehire.count
    @applicants_offered_count = @applicants_offered.count

    @new_applicant = Applicant.new
  end 

  def index 
    @jobs = @company.jobs.all
  end

  def destroy     
    @job.delete
    redirect_to company_jobs_path
  end

  def sort_applicants
    sorted_ids = params[:applicant_ids].collect(&:to_i)
    applicants = Applicant.where(id: sorted_ids).group_by(&:id)
    (0...sorted_ids.length).each do |i|
      applicants[sorted_ids[i]][0].update_attribute(:position, i+1)
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
