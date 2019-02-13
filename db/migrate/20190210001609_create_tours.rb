class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :description
      t.float :price
      t.date :deadline
      t.date :startDate
      t.date :endDate
      t.integer :totalSeats
      t.integer :availableSeats
      t.string :contactInfo

      t.timestamps
    end
  end
end
