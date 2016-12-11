class FixturesGroupsController < ApplicationController
  def home
    @fixtures_groups = FixturesGroup.all
  end
end
