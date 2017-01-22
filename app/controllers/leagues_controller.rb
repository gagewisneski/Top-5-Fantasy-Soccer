class LeaguesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :ceate, :edit, :update, :destroy] 
  before_action :current_user_admin, only: [:edit, :update, :destroy]

  def index
    # Display all the public leagues
    @players = current_season.users_seasons.where("score > ?", 0).order(score: :desc)
  end

  def new
    # Form to create a new private or public league
    @league = League.new
  end

  def create
    # Creates a league
    @league = League.new(name: params[:name], private: params[:private], password: params[:password], image: params[:image], admin_id: current_user.id)
    if @league.save
      UsersLeague.create(league_id: @league.id, user_id: current_user.id)
      flash[:success] = "You have created a league"
      redirect_to "/leagues"
    else
      flash[:warning] = "Whoops, you messed it all up"
      render :new
    end
  end

  def show
    # Shows the leagues top 25 users
    # Only admins have acces to edit and destroy links
    @league = League.find(params[:id])
  end

  def edit
    # Form to edit league
    @league = League.find(params[:id])
  end

  def update
    # Updates league
    @league = League.find(params[:id])
    @league.assign_attributes(name: params[:name], private: params[:private], image: params[:image])
    if @league.save
      flash[:success] = "You have edited your league"
      redirect_to "/leagues"
    else
      flash[:warning] = "Whoops, you messed it all up"
      render :edit
    end
  end

  def destroy
    # Destroys league
    league = League.find(params[:id])
    users_leagues = UsersLeague.where(league_id: league.id)
    users_leagues.destroy_all
    league.destroy
    redirect_to "/leagues"
  end

  def indexes
    @leagues = League.all
  end
end
