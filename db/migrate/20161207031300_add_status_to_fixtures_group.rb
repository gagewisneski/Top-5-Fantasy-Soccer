class AddStatusToFixturesGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :fixtures_groups, :status, :boolean
  end
end
