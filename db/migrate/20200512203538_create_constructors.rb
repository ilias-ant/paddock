class CreateConstructors < ActiveRecord::Migration[6.0]
  def change
    create_table :constructors do |t|
      t.string :name, null: false
      t.string :nickname, null: false
      t.string :nationality
      t.string :url, null: false

      t.timestamps
    end
  end
end
