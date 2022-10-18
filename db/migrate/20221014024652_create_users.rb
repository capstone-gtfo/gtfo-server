class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone
      t.string :lat
      t.string :long
    end
  end
end
