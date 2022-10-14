class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.integer :phone_number
      t.integer :latitude
      t.integer :longitude
    end
  end
end
