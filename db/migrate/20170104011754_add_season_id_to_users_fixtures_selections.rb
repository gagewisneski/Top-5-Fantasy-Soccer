class AddSeasonIdToUsersFixturesSelections < ActiveRecord::Migration[5.0]
  def change
    add_column :users_fixtures_selections, :season_id, :integer
  end
end
