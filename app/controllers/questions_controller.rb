class QuestionsController < ApplicationController
  before_action :fetch_job


  def new
    @question = @job.questions.new
  end

  def create
    @question = @job.questions.new(question_params)
    @question.save!    
  end

  def edit
  end

  def update
  end

  def delete
  end


  private 

    def question_params 
      params.require(:question)
    end 

    def fetch_job
        @job = Job.find(params[:job_id])
    end
end
