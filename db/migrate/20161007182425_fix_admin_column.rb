class FixAdminColumn < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :admin, :boolean, null: false, default: false
  end

  def down
    change_column :users, :admin, :boolean, null: false, default: false
  end
end
