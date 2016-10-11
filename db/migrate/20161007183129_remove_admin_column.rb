class RemoveAdminColumn < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :admin, :boolean, null: false, default: false
  end

  def down
    add_column :users, :admin, :boolean, null: false, default: false
  end
end
