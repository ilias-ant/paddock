class CreateCircuits < ActiveRecord::Migration[6.0]
  def change
    create_table :circuits do |t|
      t.string :nickname, null: false
      t.string :name, null: false
      t.string :location
      t.string :country
      t.float :lat
      t.float :lnd
      t.integer :alt
      t.string :url, null: false

      t.timestamps
    end
  end
end
