class ChangeColumnToString < ActiveRecord::Migration[5.0]
  def up
    change_column :reviews, :rating, :string, null: false
  end

  def down
    change_column :reviews, :rating, :integer, null: false
  end
end
