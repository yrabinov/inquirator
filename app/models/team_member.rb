require 'digest/md5'
class TeamMember < ActiveRecord::Base
  belongs_to :team
  validates :email, presence: true
  
  def self.reporting_to(manager)
    manager.team_members
  end
  
  def first_name
    name.split(' ').first
  end
  
  def email_hash
    Digest::MD5.hexdigest email.downcase.strip
  end
  
  def gravatar_url
    "http://www.gravatar.com/avatar/#{email_hash}"
  end
end
