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
end
