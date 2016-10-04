class AddReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :movie, null: false
      t.belongs_to :user, null: false
      t.integer :rating, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
