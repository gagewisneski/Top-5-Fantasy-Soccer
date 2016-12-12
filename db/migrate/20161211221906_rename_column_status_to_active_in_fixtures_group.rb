class RenameColumnStatusToActiveInFixturesGroup < ActiveRecord::Migration[5.0]
  def change
    rename_column :fixtures_groups, :status, :active
  end
end
