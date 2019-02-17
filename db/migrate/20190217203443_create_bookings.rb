class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :status
      t.integer :seatsToBook
      t.references :user
      t.references :tour
      t.timestamps
    end
  end
end
