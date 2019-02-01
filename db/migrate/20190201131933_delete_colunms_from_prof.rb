class DeleteColunmsFromProf < ActiveRecord::Migration[5.1]
  def change
    remove_column :professions, :user_id
    remove_column :professions, :profession
  end
end
