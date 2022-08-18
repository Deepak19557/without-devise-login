class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="Signup successful"
      redirect_to users_path
    else
      flash[:notice]="Please try again"
      redirect_to root_path
    end
  end


  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password)
    end

end
