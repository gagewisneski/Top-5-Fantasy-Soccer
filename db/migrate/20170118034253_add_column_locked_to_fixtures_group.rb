class AddColumnLockedToFixturesGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :fixtures_groups, :locked, :boolean
  end
end
