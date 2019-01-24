class ChangeAccountActive < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :account_active, :boolean, :default => true
  end
end
