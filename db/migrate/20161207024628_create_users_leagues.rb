class CreateUsersLeagues < ActiveRecord::Migration[5.0]
  def change
    create_table :users_leagues do |t|
      t.integer :user_id
      t.integer :league_id

      t.timestamps
    end
  end
end
