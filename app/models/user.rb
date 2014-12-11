class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :team
  
  delegate :team_members, to: :team
  
  def team
    Team.find_or_create_by(user_id:self.id)
  end
  
  def first_name
    name.split(' ').first rescue "Your humble manager"
  end
  
  def email_hash
    Digest::MD5.hexdigest email.downcase.strip
  end
  
  def gravatar_url
    "http://www.gravatar.com/avatar/#{email_hash}"
  end
end
