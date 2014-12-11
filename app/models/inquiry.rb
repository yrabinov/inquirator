class Inquiry < ActiveRecord::Base
  belongs_to :question
  belongs_to :team_member
  before_create :set_response_token
  
  delegate :team, to: :team_member
  scope :responded, ->{where responded:true}
  
  def set_response_token
    write_attribute(:response_token,SecureRandom.uuid)
  end
  
  def manager
    question.team.manager rescue OpenStruct.new(name:"Manager", first_name:"Manager", email:"manager@inquirator.com")
  end
  
  def other_team_member_names
    names = team.team_members.pluck(:name) - [team_member.name]
  end
  
  def show_response_choice?
    question.category == "fill_in_the_blank"
  end
  
  def show_response_buttons?
    question.category == "multiple_choice"
  end
  
  def other_team_members_list
    names = other_team_member_names
    last_other_team_member = names.delete_at -1
    list = names.join ", "
    list << "#{',' if names.count > 1}#{' and ' if names.any?}#{last_other_team_member}" if last_other_team_member
    list
  end
end
