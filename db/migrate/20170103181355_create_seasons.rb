class CreateSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.boolean :active
      t.string :year

      t.timestamps
    end
  end
end
