class InquiryMailer < ActionMailer::Base
  
  def question_email(inquiry)
    @inquiry = inquiry
    @team_member = inquiry.team_member
    mail(to:@team_member.email, from:inquiry.manager.email,subject:"Inquirator: Question From Your Manager")
  end
end
