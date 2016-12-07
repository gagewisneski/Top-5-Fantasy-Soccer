class CreateLeagues < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.boolean :private
      t.string :password_digest
      t.string :description
      t.string :image
      t.integer :admin_id

      t.timestamps
    end
  end
end
