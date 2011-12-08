class AddRegistrationsstartatToSchools < ActiveRecord::Migration
  def self.up
    add_column :schools, :registrations_start_at, :date
  end

  def self.down
    remove_column :schools, :registrations_start_at
  end
end
