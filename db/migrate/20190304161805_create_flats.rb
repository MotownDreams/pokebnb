class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.references :user, foreign_key: true
      t.string :location
      t.integer :price_per_night
      t.text :description

      t.timestamps
    end
  end
end
