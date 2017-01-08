class RemoveFixturesFromFixturesGroup < ActiveRecord::Migration[5.0]
  def change
    remove_column :fixtures_groups, :fixture1_id, :integer
    remove_column :fixtures_groups, :fixture2_id, :integer
    remove_column :fixtures_groups, :fixture3_id, :integer
    remove_column :fixtures_groups, :fixture4_id, :integer
    remove_column :fixtures_groups, :fixture5_id, :integer
    remove_column :fixtures_groups, :fixture6_id, :integer
    remove_column :fixtures_groups, :fixture7_id, :integer
    remove_column :fixtures_groups, :fixture8_id, :integer
    remove_column :fixtures_groups, :fixture9_id, :integer
    remove_column :fixtures_groups, :fixture10_id, :integer
  end
end
