class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(name: params[:name], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      UsersSeason.create(user_id: @user.id, season_id: current_season.id, score: 0)
      flash[:success] = "You have successfully signed up!"
      redirect_to "/"
    else
      flash[:warning] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    
  end
end
