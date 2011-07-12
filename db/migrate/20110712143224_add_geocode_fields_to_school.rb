class AddGeocodeFieldsToSchool < ActiveRecord::Migration
  def self.up
    add_column :schools, :latitude, :float
    add_column :schools, :longitude, :float
    add_column :schools, :gmaps, :boolean
  end

  def self.down
    remove_column :schools, :longitude
    remove_column :schools, :latitude
    remove_column :schools, :gmaps
  end
end
