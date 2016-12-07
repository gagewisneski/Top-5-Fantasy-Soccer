class CreateFixturesGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :fixtures_groups do |t|

      t.datetime :week_start_date
      t.datetime :week_end_date
      t.integer :fixture1_id
      t.integer :fixture2_id
      t.integer :fixture3_id
      t.integer :fixture4_id
      t.integer :fixture5_id
      t.integer :fixture6_id
      t.integer :fixture7_id
      t.integer :fixture8_id
      t.integer :fixture9_id
      t.integer :fixture10_id
      t.timestamps
    end
  end
end
