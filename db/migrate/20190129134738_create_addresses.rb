class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :country
      t.string :city
      t.string :street
      t.string :home_number

      t.timestamps
    end
  end
end
