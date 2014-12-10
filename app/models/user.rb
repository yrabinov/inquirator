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
end
