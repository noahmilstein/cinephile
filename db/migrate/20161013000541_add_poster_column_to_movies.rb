class AddPosterColumnToMovies < ActiveRecord::Migration[5.0]
  def up
    add_column :movies, :poster, :string
  end

  def down
    remove_column :movies, :poster, :string
  end
end
