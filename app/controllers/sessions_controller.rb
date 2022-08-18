class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice]="Login successful"
      redirect_to users_path
    else
      flash[:notice]="Invalid Email or Password"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice]="Logged Out"
    redirect_to root_path
  end
end