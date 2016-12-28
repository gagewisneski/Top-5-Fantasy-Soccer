class UsersLeaguesController < ApplicationController
  before_action :authenticate_user!

  def new
    # form to join a league
    @league = League.new
  end

  def create
    @league = League.find_by(name: params[:league_name])
    if params[:password] == @league.password_digest
      @usersleague = UsersLeague.create(user_id: current_user.id, league_id: @league.id)
      redirect_to "/leagues/#{@league.id}"
    else
      flash[:warning] = "Wrong league name or password"
      render :new
    end
  end

  def show
    @leagues = User.find(current_user.id).leagues
  end

  def destroy
    # link to leave league or link to delete person from your league?
    @users_league = UsersLeague.find(params[:id])
    @users_league.destroy
    redirect_to "/leagues"
  end
end
