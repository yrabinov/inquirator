class InquiryMailer < ActionMailer::Base
  
  def question_email(inquiry)
    @inquiry = inquiry
    @team_member = inquiry.team_member
    mail(to:@team_member.email, from:inquiry.manager.email,subject:"Inquirator: Question From Your Manager")
  end
  
  def responses_team(question,team_member,manager_email)
    @team_member = team_member #the recipient
    @question = question
    @inquiries = question.inquiries.responded.where(confidential:false)
    mail(to:@team_member.email, from:manager_email,subject:"Inquirator: Responses")
  end
  
  def responses_manager(question,team_member,manager_email)
    @team_member = team_member #the recipient
    @question = question
    @inquiries = question.inquiries.responded
    mail(to:@team_member.email, from:manager_email,subject:"Inquirator: Responses from your team")
  end
end
