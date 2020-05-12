class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :forename, null: false
      t.string :surname, null: false
      t.string :nickname, null: false
      t.date :dob
      t.integer :number
      t.string :code, limit: 3
      t.string :nationality
      t.string :url, null: false

      t.timestamps
    end
  end
end
