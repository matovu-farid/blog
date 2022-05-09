class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def create
 
    user = User.new params
    user.save
  end
  def update
    user = User.new params
    user.save
  end
  def show
    @user = User.find(params[:id])
  end
  private
  def user_params
     params.require(:user).permit(:name,:password,:password_confirmation)
  end
end
