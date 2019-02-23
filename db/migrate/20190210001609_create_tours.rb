class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.string :tourname
      t.string :description
      t.float :price
      t.date :deadline
      t.date :startDate
      t.date :endDate
      t.string :tourStatus
      t.integer :totalSeats
      t.integer :availableSeats
      t.integer :waitlistedSeats
      t.string :contactInfo
      t.string :username
      t.references :user
      t.timestamps
    end
  end
end
