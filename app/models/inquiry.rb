class Inquiry < ActiveRecord::Base
  belongs_to :question
  belongs_to :team_member
  before_create :set_response_token
  
  def set_response_token
    write_attribute(:response_token,SecureRandom.uuid)
  end
  
  def manager
    question.team.manager rescue OpenStruct.new(name:"Manager", first_name:"Manager", email:"manager@inquirator.com")
  end
end
