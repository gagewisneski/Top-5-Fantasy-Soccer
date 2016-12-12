class FixturesGroupsController < ApplicationController
  def index
    @fixtures_groups = FixturesGroup.all
  end
  def create
  end
  def new
  end
  def show
    @fixtures_group = FixturesGroup.find(params[:id])
  end
  def edit
  end
  def update
  end
  def destroy
  end
end
