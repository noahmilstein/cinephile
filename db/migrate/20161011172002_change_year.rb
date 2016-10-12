class ChangeYear < ActiveRecord::Migration[5.0]
  def up
    change_column :movies, :year, :string, null: false
  end

  def down
    change_column :movies, :year, :integer, null: false
  end
end
