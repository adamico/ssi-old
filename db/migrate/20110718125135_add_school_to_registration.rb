class AddSchoolToRegistration < ActiveRecord::Migration
  def self.up
    add_column :registrations, :school_id, :integer
  end

  def self.down
    remove_column :registrations, :school_id
  end
end
