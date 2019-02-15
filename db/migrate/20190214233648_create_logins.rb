class CreateLogins < ActiveRecord::Migration[5.1]
  def change
    create_table :logins do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :role
      t.timestamps
    end
  end
end
