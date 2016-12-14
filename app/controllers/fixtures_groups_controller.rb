class FixturesGroupsController < ApplicationController
  def index
    # Website homepage, displays the active fixtures_group.
    @fixtures_group = FixturesGroup.find_by(active: true)
  end

  def create
    # Automatically make a fixtures_group?
  end
  
  def new
    # Depends on create
  end
  
  def show
    # Probably don't need this since users will view past ones with user input in users_fixtures_selection
    @fixtures_group = FixturesGroup.find(params[:id])
  end
  
  def edit
    # Don't need this
  end
  
  def update
    # Don't need this
  end
  
  def destroy
    # Don't need this
  end
end
