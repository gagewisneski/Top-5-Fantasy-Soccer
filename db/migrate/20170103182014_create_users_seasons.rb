class CreateUsersSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :users_seasons do |t|
      t.integer :user_id
      t.integer :season_id
      t.integer :score

      t.timestamps
    end
  end
end
