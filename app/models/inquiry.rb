class Inquiry < ActiveRecord::Base
  belongs_to :question
  belongs_to :team_member
end
