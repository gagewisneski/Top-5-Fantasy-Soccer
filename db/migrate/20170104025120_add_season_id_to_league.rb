class AddSeasonIdToLeague < ActiveRecord::Migration[5.0]
  def change
    add_column :leagues, :season_id, :integer
  end
end
