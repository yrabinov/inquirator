class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice:"User successfully created."
    else
      render action: :new, alert: "Error creating user."
    end
  end
  
  def update
    if @user.update_attributes(user_params)
      redirect_to users_path, notice:"User successfully updated."
    else
      render action: :edit, alert: "Error updating user."
    end
  end
  
  def edit
    
  end
  
  def destroy
    @user.destroy
  end
  
  private def find_user
    @user = User.find params[:id]
  end
  
  private def user_params
    params[:user].require(:id).permit(:name, :email)
  end
end
