class AddColumnTitleToReview < ActiveRecord::Migration[5.0]
  def up
    add_column :reviews, :title, :string, null: false
  end

  def down
    remove_column :reviews, :title, :string, null: false
  end
end
