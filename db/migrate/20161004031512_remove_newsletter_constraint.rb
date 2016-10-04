class RemoveNewsletterConstraint < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :newsletter, :boolean, :null => true, :default => false
  end
end
