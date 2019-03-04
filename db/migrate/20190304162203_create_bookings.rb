class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :flat, foreign_key: true
      t.references :user, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :state
      t.integer :total_price

      t.timestamps
    end
  end
end
