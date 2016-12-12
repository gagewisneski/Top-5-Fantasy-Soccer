class LeaguesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :ceate, :edit, :update, :destroy] 
  before_action :current_user_admin, only: [:edit, :update, :destroy]

  def index
    @leagues = League.where(private: false)
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(name: params[:name], private: params[:private], password: params[:password], password_confirmation: parmas[:password_confirmation], description: params[:description], image: params[:image], admin_id: current_user.id)
    if @league.save
      flash[:success] = "You have created a league"
      redirect_to "/leagues"
    else
      flash[:warning] = "Whoops, you messed it all up"
      render :new
    end
  end

  def show
    @league = League.find(params[:id])
  end

  def edit
    @league = League.find(params[:id])
  end

  def update
    @league = League.find(params[:id])
    @league.assign_attributes(name: params[:name], private: params[:private], description: params[:description], image: params[:image])
    if @league.save
      flash[:success] = "You have edited your league"
      redirect_to "/leagues"
    else
      flash[:warning] = "Whoops, you messed it all up"
      render :edit
    end
  end

  def destroy
    league = League.find(params[:id])
    league.destroy
    redirect_to "/leagues"
  end
end
