class AddUserToMovies < ActiveRecord::Migration[5.0]
  def change
    add_reference :movies, :user, foreign_key: true, null: false
  end
end
