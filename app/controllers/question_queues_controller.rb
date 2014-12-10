class QuestionQueuesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @heartbeat_queue = QuestionQueue.heartbeat_queue_for_manager(current_user)
    @company_queue = QuestionQueue.company_queue_for_manager(current_user)
    @social_queue = QuestionQueue.social_queue_for_manager(current_user)
  end
  
  def edit
    @question_queue = QuestionQueue.find params[:id]
    @question = @question_queue.questions.new(question_queue_id:@question_queue.id)
  end
  
  def update
    @question_queue = QuestionQueue.find params[:id]
    if @question_queue.update_attributes(question_queue_params)
      render json:{status:"ok"}, status: :ok
    else
      render json:{status:"error"}, status: :unprocessable_entity
    end
  end
  
  private def question_queue_params
    params.require(:question_queue).permit(:question_order)
  end
end
