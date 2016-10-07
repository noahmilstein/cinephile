class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :user, null: false
      t.belongs_to :review, null: false
      t.integer :upvote, default: 0
      t.integer :downvote, default: 0

      t.timestamps
    end
  end
end
