class ResponsesController < ApplicationController
  before_action :get_inquiry!
  
  def respond
    
  end
  
  private def get_inquiry!
    @inquiry = Inquiry.find_by_response_token params[:response_token] || not_found
  end
end
