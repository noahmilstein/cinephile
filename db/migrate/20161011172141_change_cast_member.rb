class ChangeCastMember < ActiveRecord::Migration[5.0]
  def up
    rename_column :movies, :cast, :cast_member
  end

  def down
    rename_column :movies, :cast_member, :cast
  end
end
