class QuestionQueue < ActiveRecord::Base
  belongs_to :team
  has_many :questions
  
  def questions_ordered
    questions.order('position asc')
  end
  
  def self.heartbeat_queue_for_manager(manager)
    find_or_create_by(team_id:manager.team.id,category:"heartbeat")
  end
  
  def self.company_queue_for_manager(manager)
    find_or_create_by(team_id:manager.team.id,category:"company")
  end
  
  def self.social_queue_for_manager(manager)
    find_or_create_by(team_id:manager.team.id,category:"social")
  end
  
  def next_question
    questions_ordered.first.text rescue ""
  end
  
  def question_order
    questions_ordered.pluck(:id).join ','
  end
  
  def question_order=(value)
    question_ids_in_order = value.split ','
    question_ids_in_order.each_with_index do |question_id, idx|
      Question.find(question_id).update_attribute(:position, idx) #TODO: do this in one query; we'll need to save the queries later.
    end
  end
  
  def email_current_question_to_team
    return if questions_ordered.empty?
    question = questions_ordered.first
    team.team_members.each do |member|
      inquiry = Inquiry.create(question_id:question.id,team_member_id:member.id)
      InquiryMailer.question_email(inquiry).deliver
    end
    question.update_attribute(:question_queue_id,nil) unless category == "heartbeat"
    self.update_attribute(:last_question_id,question.id)
  end
  
  def last_question
    Question.find last_question_id rescue nil
  end
  
  def email_last_question_responses_to_team
    return if last_question.blank?
    team.team_members.each do |member|
      next if member.email == team.user.email
      InquiryMailer.responses_team(last_question,member,team.user.email).deliver
    end
    InquiryMailer.responses_manager(last_question,team.user,team.user.email).deliver
  end
end
