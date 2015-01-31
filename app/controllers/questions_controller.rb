class QuestionsController < ApplicationController
  before_action :fetch_job
  before_action :fetch_question, only: [:update, :show]


  def new
    @question = @job.questions.new
  end

  def create
    @question = @job.questions.new(question_params)
    @save_success = @question.save
  end

  def edit
  end

  def update
   
  end

  def delete
  end


  private 

    def question_params 
      params.require(:question).permit(:question)
    end 

    def fetch_job
      @job = Job.find(params[:job_id])
    end

    def fetch_question
      @question = Question.find(params[:id])
    end 
end
