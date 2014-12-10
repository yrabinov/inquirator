class QuestionQueuesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @heartbeat_queue = QuestionQueue.heartbeat_queue_for_manager(current_user)
    @company_queue = QuestionQueue.company_queue_for_manager(current_user)
    @social_queue = QuestionQueue.social_queue_for_manager(current_user)
  end
  
  def edit
    @question_queue = QuestionQueue.find params[:id]
    @question = @question_queue.questions.new
  end
end
