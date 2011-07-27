class AddDetailsToRegistration < ActiveRecord::Migration
  def self.up
    add_column :registrations, :card_type, :string
    add_column :registrations, :card_expires_on, :date
  end

  def self.down
    remove_column :registrations, :card_expires_on
    remove_column :registrations, :card_type
  end
end
