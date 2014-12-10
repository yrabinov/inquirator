class Team < ActiveRecord::Base
  belongs_to :user
  has_many :team_members
  alias_method :manager, :user
end
