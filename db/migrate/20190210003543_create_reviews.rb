class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :tourReview
      t.references :tour
      t.timestamps
      t.references :user
      t.string :username
      t.string :tourname
    end
  end
end
