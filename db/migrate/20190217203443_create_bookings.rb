
class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :status
      t.integer :seatsToBook
      t.references :user
      t.references :tour
      t.timestamps
      t.string :username
      t.string :tourname
    end
  end
end
