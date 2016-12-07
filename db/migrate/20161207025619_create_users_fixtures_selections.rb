class CreateUsersFixturesSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :users_fixtures_selections do |t|
      t.integer :user_id
      t.integer :fixtures_group_id
      t.integer :game_1_home_score
      t.integer :game_1_away_score
      t.integer :game_2_home_score
      t.integer :game_2_away_score
      t.integer :game_3_home_score
      t.integer :game_3_away_score
      t.integer :game_4_home_score
      t.integer :game_4_away_score
      t.integer :game_5_home_score
      t.integer :game_5_away_score
      t.integer :game_6_home_score
      t.integer :game_6_away_score
      t.integer :game_7_home_score
      t.integer :game_7_away_score
      t.integer :game_8_home_score
      t.integer :game_8_away_score
      t.integer :game_9_home_score
      t.integer :game_9_away_score
      t.integer :game_10_home_score
      t.integer :game_10_away_score
      t.integer :score

      t.timestamps
    end
  end
end
