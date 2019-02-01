class AddProfNameToProfessions < ActiveRecord::Migration[5.1]
  def change
    add_column :professions, :prof_name, :string
  end
end
