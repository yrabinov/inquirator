class InquiriesController < ApplicationController
  before_action :validate_inquiry!
  
  def update
    @inquiry.update_attributes(inquiry_params.merge(responded:true))
    render 'response_confirm'
  end
  
  private def validate_inquiry!
    @inquiry = Inquiry.find params[:id]
    return not_found if @inquiry.response_token != params[:inquiry][:response_token]
  end
  
  private def inquiry_params
    params.require(:inquiry).permit(:response_choice, :extended_response, :response_token)
  end
end
