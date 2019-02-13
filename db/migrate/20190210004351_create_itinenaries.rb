class CreateItinenaries < ActiveRecord::Migration[5.1]
  def change
    create_table :itinenaries do |t|
      t.string :state
      t.string :country
      t.references :tour
      t.timestamps
    end
  end
end
