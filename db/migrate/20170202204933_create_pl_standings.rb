class CreatePlStandings < ActiveRecord::Migration[5.0]
  def change
    create_table :pl_standings do |t|
      t.string :team_name
      t.string :place
      t.string :score

      t.timestamps
    end
  end
end
