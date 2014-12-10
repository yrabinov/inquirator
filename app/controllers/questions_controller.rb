class QuestionsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    if @question = Question.create(params.require(:question).permit(:question_queue_id,:position, :text, :responses_field))
      redirect_to edit_question_queue_path(@question.question_queue), notice:"Question added!"
    else
      redirect_to edit_question_queue_path(QuestionQueue.find(params[:question][:question_queue_id]))
    end
  end
end
