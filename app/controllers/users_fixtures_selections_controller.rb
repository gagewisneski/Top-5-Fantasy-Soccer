class UsersFixturesSelectionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :ceate, :edit, :update, :destroy]
  before_action :new_selections?, only: [:new]
  before_action :top_5?, only: [:update_all_scores, :edit_all_scores]

  def index
    # Acts as a league for everyone and shows the top 25 overall scorers
    @leaders = User.all.order(score: :desc)
  end

  def new
    # User inputs scores for each fixture
    @fixtures_group = FixturesGroup.find_by(active: true)
    @selection = UsersFixturesSelection.new
  end

  def create
    @selection = UsersFixturesSelection.create(user_id: current_user.id, fixtures_group_id: params[:fixtures_group_id], score: 0, game_1_home_score: params[:game_1_home_score], game_1_away_score: params[:game_1_away_score], game_2_home_score: params[:game_2_home_score], game_2_away_score: params[:game_2_away_score], game_3_home_score: params[:game_3_home_score], game_3_away_score: params[:game_3_away_score], game_4_home_score: params[:game_4_home_score], game_4_away_score: params[:game_4_away_score], game_5_home_score: params[:game_5_home_score], game_5_away_score: params[:game_5_away_score], game_6_home_score: params[:game_6_home_score], game_6_away_score: params[:game_6_away_score], game_7_home_score: params[:game_7_home_score], game_7_away_score: params[:game_7_away_score], game_8_home_score: params[:game_8_home_score], game_8_away_score: params[:game_8_away_score], game_9_home_score: params[:game_9_home_score], game_9_away_score: params[:game_9_away_score], game_10_home_score: params[:game_10_home_score], game_10_away_score: params[:game_10_away_score])
    redirect_to "/users_fixtures_selections/#{@selection.id}/edit"
  end
  
  def show
    # Shows the last completed weeks fixtures selections with their total score and a list of all previously completed weeks with score
    @selection = UsersFixturesSelection.find(params[:id])
    @selections = UsersFixturesSelection.where(user_id: current_user.id)
  end
  
  def edit
    # User can change their inputs for the current fixtures
    @selection = FixturesGroup.find_by(active: true).users_fixtures_selections.find_by(user_id: current_user.id)
    @fixtures_group = FixturesGroup.find_by(active: true)

    @myselection = UsersFixturesSelection.find(params[:id])
  end
  
  def update
    @myselection = UsersFixturesSelection.find(params[:id])
    @myselection.assign_attributes(game_1_home_score: params[:game_1_home_score], game_1_away_score: params[:game_1_away_score], game_2_home_score: params[:game_2_home_score], game_2_away_score: params[:game_2_away_score], game_3_home_score: params[:game_3_home_score], game_3_away_score: params[:game_3_away_score], game_4_home_score: params[:game_4_home_score], game_4_away_score: params[:game_4_away_score], game_5_home_score: params[:game_5_home_score], game_5_away_score: params[:game_5_away_score], game_6_home_score: params[:game_6_home_score], game_6_away_score: params[:game_6_away_score], game_7_home_score: params[:game_7_home_score], game_7_away_score: params[:game_7_away_score], game_8_home_score: params[:game_8_home_score], game_8_away_score: params[:game_8_away_score], game_9_home_score: params[:game_9_home_score], game_9_away_score: params[:game_9_away_score], game_10_home_score: params[:game_10_home_score], game_10_away_score: params[:game_10_away_score])
    @myselection.save
    redirect_to "/users_fixtures_selections/#{@myselection.id}/edit"
  end

  def edit_all_sccores
    
  end

  def update_all_scores
    @scores = UsersFixtureSelection.find(params[:id])
    group = @scores.fixtures_group
    score = 0

    if (@scores.game_1_home_score == group.game_1_home_score) && (@scores.game_1_away_score == group.game_1_home_score)
      score = score + 10
    elsif ((@scores.game_1_home_score == group.game_1_home_score) && (@scores.game_1_home_score > @scores.game_1_away_score) && (@group.game_1_home_score > group.game_1_away_score)) || ((@scores.game_1_home_score == group.game_1_home_score) && (@scores.game_1_home_score < @scores.game_1_away_score) && (@group.game_1_home_score < group.game_1_away_score)) || ((@scores.game_1_away_score == group.game_1_away_score) && (@scores.game_1_home_score > @scores.game_1_away_score) && (@group.game_1_home_score > group.game_1_away_score)) || ((@scores.game_1_away_score == group.game_1_away_score) && (@scores.game_1_home_score < @scores.game_1_away_score) && (@group.game_1_home_score < group.game_1_away_score))
      score = score + 5
    elsif (@scores.game_1_home_score == @group.game_1_home_score) || (@scores.game_1_away_score == @group.game_1_away_score)
      score = 2
    end

    if (@scores.game_2_home_score == group.game_2_home_score) && (@scores.game_2_away_score == group.game_2_home_score)
      score = score + 10
    elsif ((@scores.game_2_home_score == group.game_2_home_score) && (@scores.game_2_home_score > @scores.game_2_away_score) && (@group.game_2_home_score > group.game_2_away_score)) || ((@scores.game_2_home_score == group.game_2_home_score) && (@scores.game_2_home_score < @scores.game_2_away_score) && (@group.game_2_home_score < group.game_2_away_score)) || ((@scores.game_2_away_score == group.game_2_away_score) && (@scores.game_2_home_score > @scores.game_2_away_score) && (@group.game_2_home_score > group.game_2_away_score)) || ((@scores.game_2_away_score == group.game_2_away_score) && (@scores.game_2_home_score < @scores.game_2_away_score) && (@group.game_2_home_score < group.game_2_away_score))
      score = score + 5
    elsif (@scores.game_2_home_score == @group.game_2_home_score) || (@scores.game_2_away_score == @group.game_2_away_score)
      score = 2
    end

    if (@scores.game_3_home_score == group.game_3_home_score) && (@scores.game_3_away_score == group.game_3_home_score)
      score = score + 10
    elsif ((@scores.game_3_home_score == group.game_3_home_score) && (@scores.game_3_home_score > @scores.game_3_away_score) && (@group.game_3_home_score > group.game_3_away_score)) || ((@scores.game_3_home_score == group.game_3_home_score) && (@scores.game_3_home_score < @scores.game_3_away_score) && (@group.game_3_home_score < group.game_3_away_score)) || ((@scores.game_3_away_score == group.game_3_away_score) && (@scores.game_3_home_score > @scores.game_3_away_score) && (@group.game_3_home_score > group.game_3_away_score)) || ((@scores.game_3_away_score == group.game_3_away_score) && (@scores.game_3_home_score < @scores.game_3_away_score) && (@group.game_3_home_score < group.game_3_away_score))
      score = score + 5
    elsif (@scores.game_3_home_score == @group.game_3_home_score) || (@scores.game_3_away_score == @group.game_3_away_score)
      score = 2
    end

    if (@scores.game_4_home_score == group.game_4_home_score) && (@scores.game_4_away_score == group.game_4_home_score)
      score = score + 10
    elsif ((@scores.game_4_home_score == group.game_4_home_score) && (@scores.game_4_home_score > @scores.game_4_away_score) && (@group.game_4_home_score > group.game_4_away_score)) || ((@scores.game_4_home_score == group.game_4_home_score) && (@scores.game_4_home_score < @scores.game_4_away_score) && (@group.game_4_home_score < group.game_4_away_score)) || ((@scores.game_4_away_score == group.game_4_away_score) && (@scores.game_4_home_score > @scores.game_4_away_score) && (@group.game_4_home_score > group.game_4_away_score)) || ((@scores.game_4_away_score == group.game_4_away_score) && (@scores.game_4_home_score < @scores.game_4_away_score) && (@group.game_4_home_score < group.game_4_away_score))
      score = score + 5
    elsif (@scores.game_4_home_score == @group.game_4_home_score) || (@scores.game_4_away_score == @group.game_4_away_score)
      score = 2
    end

    if (@scores.game_5_home_score == group.game_5_home_score) && (@scores.game_5_away_score == group.game_5_home_score)
      score = score + 10
    elsif ((@scores.game_5_home_score == group.game_5_home_score) && (@scores.game_5_home_score > @scores.game_5_away_score) && (@group.game_5_home_score > group.game_5_away_score)) || ((@scores.game_5_home_score == group.game_5_home_score) && (@scores.game_5_home_score < @scores.game_5_away_score) && (@group.game_5_home_score < group.game_5_away_score)) || ((@scores.game_5_away_score == group.game_5_away_score) && (@scores.game_5_home_score > @scores.game_5_away_score) && (@group.game_5_home_score > group.game_5_away_score)) || ((@scores.game_5_away_score == group.game_5_away_score) && (@scores.game_5_home_score < @scores.game_5_away_score) && (@group.game_5_home_score < group.game_5_away_score))
      score = score + 5
    elsif (@scores.game_5_home_score == @group.game_5_home_score) || (@scores.game_5_away_score == @group.game_5_away_score)
      score = 2
    end

    if (@scores.game_6_home_score == group.game_6_home_score) && (@scores.game_6_away_score == group.game_6_home_score)
      score = score + 10
    elsif ((@scores.game_6_home_score == group.game_6_home_score) && (@scores.game_6_home_score > @scores.game_6_away_score) && (@group.game_6_home_score > group.game_6_away_score)) || ((@scores.game_6_home_score == group.game_6_home_score) && (@scores.game_6_home_score < @scores.game_6_away_score) && (@group.game_6_home_score < group.game_6_away_score)) || ((@scores.game_6_away_score == group.game_6_away_score) && (@scores.game_6_home_score > @scores.game_6_away_score) && (@group.game_6_home_score > group.game_6_away_score)) || ((@scores.game_6_away_score == group.game_6_away_score) && (@scores.game_6_home_score < @scores.game_6_away_score) && (@group.game_6_home_score < group.game_6_away_score))
      score = score + 5
    elsif (@scores.game_6_home_score == @group.game_6_home_score) || (@scores.game_6_away_score == @group.game_6_away_score)
      score = 2
    end

    if (@scores.game_7_home_score == group.game_7_home_score) && (@scores.game_7_away_score == group.game_7_home_score)
      score = score + 10
    elsif ((@scores.game_7_home_score == group.game_7_home_score) && (@scores.game_7_home_score > @scores.game_7_away_score) && (@group.game_7_home_score > group.game_7_away_score)) || ((@scores.game_7_home_score == group.game_7_home_score) && (@scores.game_7_home_score < @scores.game_7_away_score) && (@group.game_7_home_score < group.game_7_away_score)) || ((@scores.game_7_away_score == group.game_7_away_score) && (@scores.game_7_home_score > @scores.game_7_away_score) && (@group.game_7_home_score > group.game_7_away_score)) || ((@scores.game_7_away_score == group.game_7_away_score) && (@scores.game_7_home_score < @scores.game_7_away_score) && (@group.game_7_home_score < group.game_7_away_score))
      score = score + 5
    elsif (@scores.game_7_home_score == @group.game_7_home_score) || (@scores.game_7_away_score == @group.game_7_away_score)
      score = 2
    end

    if (@scores.game_8_home_score == group.game_8_home_score) && (@scores.game_8_away_score == group.game_8_home_score)
      score = score + 10
    elsif ((@scores.game_8_home_score == group.game_8_home_score) && (@scores.game_8_home_score > @scores.game_8_away_score) && (@group.game_8_home_score > group.game_8_away_score)) || ((@scores.game_8_home_score == group.game_8_home_score) && (@scores.game_8_home_score < @scores.game_8_away_score) && (@group.game_8_home_score < group.game_8_away_score)) || ((@scores.game_8_away_score == group.game_8_away_score) && (@scores.game_8_home_score > @scores.game_8_away_score) && (@group.game_8_home_score > group.game_8_away_score)) || ((@scores.game_8_away_score == group.game_8_away_score) && (@scores.game_8_home_score < @scores.game_8_away_score) && (@group.game_8_home_score < group.game_8_away_score))
      score = score + 5
    elsif (@scores.game_8_home_score == @group.game_8_home_score) || (@scores.game_8_away_score == @group.game_8_away_score)
      score = 2
    end

    if (@scores.game_9_home_score == group.game_9_home_score) && (@scores.game_9_away_score == group.game_9_home_score)
      score = score + 10
    elsif ((@scores.game_9_home_score == group.game_9_home_score) && (@scores.game_9_home_score > @scores.game_9_away_score) && (@group.game_9_home_score > group.game_9_away_score)) || ((@scores.game_9_home_score == group.game_9_home_score) && (@scores.game_9_home_score < @scores.game_9_away_score) && (@group.game_9_home_score < group.game_9_away_score)) || ((@scores.game_9_away_score == group.game_9_away_score) && (@scores.game_9_home_score > @scores.game_9_away_score) && (@group.game_9_home_score > group.game_9_away_score)) || ((@scores.game_9_away_score == group.game_9_away_score) && (@scores.game_9_home_score < @scores.game_9_away_score) && (@group.game_9_home_score < group.game_9_away_score))
      score = score + 5
    elsif (@scores.game_9_home_score == @group.game_9_home_score) || (@scores.game_9_away_score == @group.game_9_away_score)
      score = 2
    end

    if (@scores.game_10_home_score == group.game_10_home_score) && (@scores.game_10_away_score == group.game_10_home_score)
      score = score + 10
    elsif ((@scores.game_10_home_score == group.game_10_home_score) && (@scores.game_10_home_score > @scores.game_10_away_score) && (@group.game_10_home_score > group.game_10_away_score)) || ((@scores.game_10_home_score == group.game_10_home_score) && (@scores.game_10_home_score < @scores.game_10_away_score) && (@group.game_10_home_score < group.game_10_away_score)) || ((@scores.game_10_away_score == group.game_10_away_score) && (@scores.game_10_home_score > @scores.game_10_away_score) && (@group.game_10_home_score > group.game_10_away_score)) || ((@scores.game_10_away_score == group.game_10_away_score) && (@scores.game_10_home_score < @scores.game_10_away_score) && (@group.game_10_home_score < group.game_10_away_score))
      score = score + 5
    elsif (@scores.game_10_home_score == @group.game_10_home_score) || (@scores.game_10_away_score == @group.game_10_away_score)
      score = 2
    end

    @scores.assign_attributes(score: score)
    @scores.save

    total_score = @score.user
    score = score + total_score.score
    total_score.assign_attributes(score: score)

    redirect_to "/"
  end
  
  def destroy
    # you can't delete your selections
  end
end
