class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "You are now logged in"
      redirect_to "/"
    else
      flash[:warning] = "Wrong login information"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You are now logged out"
    redirect_to "/"
  end
end
