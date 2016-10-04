class FixColumnName < ActiveRecord::Migration[5.0]
  def up
    rename_column :movies, :scren_writer, :screen_writer
  end
  def down
    rename_column :movies, :screen_writer, :scren_writer
  end
end
