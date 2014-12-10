class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, only: [:edit, :update, :destroy]
  
  def create
    if @question = Question.create(question_params)
      redirect_to edit_question_queue_path(@question.question_queue), notice:"Question added!"
    else
      redirect_to edit_question_queue_path(QuestionQueue.find(params[:question][:question_queue_id]))
    end
  end
  
  def edit
    @question = Question.find params[:id]
  end
  
  def update
    @question.update_attributes question_params
    redirect_to edit_question_queue_path @question.question_queue
  end
  
  private def find_question
    @question = Question.find params[:id] || not_found
  end
  
  private def question_params
    params.require(:question).permit(:question_queue_id,:position, :text, :responses_field)
  end
end
