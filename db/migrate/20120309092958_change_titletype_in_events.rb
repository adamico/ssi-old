class ChangeTitletypeInEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.change :title, :text
    end
  end
  def self.down
    change_table :events do |t|
      t.change :title, :string
    end
  end
end
