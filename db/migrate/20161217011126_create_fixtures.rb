class CreateFixtures < ActiveRecord::Migration[5.0]
  def change
    create_table :fixtures do |t|
      t.integer :fixtures_group_id
      t.string :fixture_id
      t.string :home_team
      t.string :away_team
      t.integer :home_score
      t.integer :away_score

      t.timestamps
    end
  end
end
