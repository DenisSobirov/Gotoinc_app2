class CreateJoinTableUsersProfessions < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :professions do |t|
      t.index [:user_id, :profession_id]
      t.index [:profession_id, :user_id]
    end
  end
end
