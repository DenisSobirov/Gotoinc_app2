class CreateProfessions < ActiveRecord::Migration[5.1]
  def change
    create_table :professions do |t|
      t.integer :user_id
      t.string :profession

      t.timestamps
    end
  end
end
