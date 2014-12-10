class TeamMembersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_team_member, only: [:edit, :update, :destroy]
  
  def index
    @team = current_user.team
    @team_members = TeamMember.reporting_to(current_user)
    @team_member = current_user.team.team_members.new
  end
  
  def create
    @team_member = TeamMember.new team_member_params
    if @team_member.save
      redirect_to team_members_path, notice:"Team member added."
    else
      redirect_to team_members_path, alert:"Error adding team member."
    end
  end
  
  private def find_team_member
    @team_member = TeamMember.find params[:id]
  end
  
  private def team_member_params
    params[:team_member].permit(:name, :email, :title, :team_id)
  end
end
