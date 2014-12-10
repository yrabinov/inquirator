module InquiryMailerHelper
  def response_url_for_inquiry(inquiry)
    "#{ENV['HOST_URL']}/respond?response_token=#{inquiry.response_token}"
  end
end