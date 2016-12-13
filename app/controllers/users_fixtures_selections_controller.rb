class UsersFixturesSelectionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :ceate, :edit, :update, :destroy]

  def index
    # 
  end

  def new
    # User inputs scores for each fixture
    @selection = UsersFixturesSelection.new
  end

  def create
    @selection = UsersFixturesSelection.create(user_id: current_user.id, fixtures_group_id: params[:fixtures_group_id], game_1_home_score: params[:game_1_home_score], game_1_away_score: params[:game_1_away_score], game_2_home_score: params[:game_2_home_score], game_2_away_score: params[:game_2_away_score], game_3_home_score: params[:game_3_home_score], game_3_away_score: params[:game_3_away_score], game_4_home_score: params[:game_4_home_score], game_4_away_score: params[:game_4_away_score], game_5_home_score: params[:game_5_home_score], game_5_away_score: params[:game_5_away_score], game_6_home_score: params[:game_6_home_score], game_6_away_score: params[:game_6_away_score], game_7_home_score: params[:game_7_home_score], game_7_away_score: params[:game_7_away_score], game_8_home_score: params[:game_8_home_score], game_8_away_score: params[:game_8_away_score], game_9_home_score: params[:game_9_home_score], game_9_away_score: params[:game_9_away_score], game_10_home_score: params[:game_10_home_score], game_10_away_score: params[:game_10_away_score])
    redirect_to "/users_fixtures_selections/#{@selection.id}/edit"
  end
  
  def show
    # Shows the last completed weeks fixtures selections with their total score and a list of all previously completed weeks with score
    @selection = UsersFixturesSelection.find(params[:id])
    @selections = UsersFixturesSelection.where(user_id: current_user.id)
  end
  
  def edit
    # User can change their inputs for the current fixtures
    @selection = FixturesGroup.find_by(active: true).users_fixtures_selections.where(user_id: current_user.id)


    @selection = UsersFixturesSelection.find(params[:id])
    render :new
  end
  
  def update
    @selection = UsersFixturesSelection.find(params[:id])
    @selection.assign_attributes(game_1_home_score: params[:game_1_home_score], game_1_away_score: params[:game_1_away_score], game_2_home_score: params[:game_2_home_score], game_2_away_score: params[:game_2_away_score], game_3_home_score: params[:game_3_home_score], game_3_away_score: params[:game_3_away_score], game_4_home_score: params[:game_4_home_score], game_4_away_score: params[:game_4_away_score], game_5_home_score: params[:game_5_home_score], game_5_away_score: params[:game_5_away_score], game_6_home_score: params[:game_6_home_score], game_6_away_score: params[:game_6_away_score], game_7_home_score: params[:game_7_home_score], game_7_away_score: params[:game_7_away_score], game_8_home_score: params[:game_8_home_score], game_8_away_score: params[:game_8_away_score], game_9_home_score: params[:game_9_home_score], game_9_away_score: params[:game_9_away_score], game_10_home_score: params[:game_10_home_score], game_10_away_score: params[:game_10_away_score])
    @selection.save
    redirect_to :edit
  end
  
  def destroy
    # you can't delete your selections
  end
end
