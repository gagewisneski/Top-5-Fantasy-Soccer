class FixturesGroupsController < ApplicationController
  before_action :top_5?, only: [:update_locked, :edit_locked]

  def index
    # Website homepage, displays the active fixtures_group.
    @fixtures_group = FixturesGroup.find_by(active: true)
    @pl5 = PlTeam.all
    @bl5 = BlTeam.all
    @sa5 = SaTeam.all
    @lg5 = LgTeam.all
    @ll5 = LlTeam.all
  end

  def create
    # Automatically make a fixtures_group?
  end
  
  def new
    # Depends on create
  end
  
  def edit
    # Don't need this
  end
  
  def update
    # Don't need this
  end

  def edit_locked
  end
  
  def update_locked
    @fixtures_group = FixturesGroup.find_by(active: true)
    @fixtures_group.assign_attributes(locked: true)
    flash[:success] = "Selections are now locked"
    redirect_to "/"
  end
end
