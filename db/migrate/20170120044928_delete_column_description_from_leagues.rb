class DeleteColumnDescriptionFromLeagues < ActiveRecord::Migration[5.0]
  def change
    remove_column :leagues, :description, :string
  end
end
