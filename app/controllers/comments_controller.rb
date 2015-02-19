class CommentsController < ApplicationController
  before_action :fetch_company, :fetch_job, :fetch_applicant


  def new 
    @comment = @applicant.comments.new 
  end

  def create 
    @comment = @applicant.comments.new(comment_params)
    @user=current_user
    @comment_save = @comment.save    
    @comment.update_attribute(:user_id, current_user.id)

    
  end

  def show
  end

  def destroy     
    @comment = @applicant.comments.find(params[:id])
    @comment.delete
    # render nothing: true
  end 


  private 

    def fetch_job
      @job = @company.jobs.find(params[:job_id])
    end 

    def fetch_company 
      @company = Company.find(params[:company_id])
    end

    def fetch_applicant
      @applicant = @job.applicants.find(params[:applicant_id])
    end

    def comment_params
      params.require(:comment).permit(:comment)
    end


end
