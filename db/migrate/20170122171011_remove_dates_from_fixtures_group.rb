class RemoveDatesFromFixturesGroup < ActiveRecord::Migration[5.0]
  def change
    remove_column :fixtures_groups, :week_start_date, :datetime
    remove_column :fixtures_groups, :week_end_date, :datetime
  end
end
