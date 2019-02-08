class AddColumnsToLink < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :source, :string
    add_column :links, :video_id, :string
  end
end
