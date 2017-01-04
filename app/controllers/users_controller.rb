class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You have successfully signed up!"
      redirect_to "/"
    else
      flash[:warning] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @users_selections = @user.users_fixtures_selections.order_by(id: :desc)
    @fixtures_group = FixturesGroup.find(params[:id])
  end
end
