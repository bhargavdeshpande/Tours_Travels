class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
    t.references :user
    t.references :tour
    #t.string :user_name
    #t.string :tour_name
      t.timestamps
    t.string :username
    t.string :tourname
    end
  end
end
