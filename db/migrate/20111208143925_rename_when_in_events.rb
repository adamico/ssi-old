class RenameWhenInEvents < ActiveRecord::Migration
  def self.up
    rename_column :events, :when, :starts_at
  end

  def self.down
    rename_column :events, :starts_at, :when
  end
end
