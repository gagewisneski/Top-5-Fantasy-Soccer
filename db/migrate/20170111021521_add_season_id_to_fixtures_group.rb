class AddSeasonIdToFixturesGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :fixtures_groups, :season_id, :integer
  end
end
