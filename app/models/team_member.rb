class TeamMember < ActiveRecord::Base
  belongs_to :team
  validates :email, presence: true
  
  def self.reporting_to(manager)
    manager.team_members
  end
end
