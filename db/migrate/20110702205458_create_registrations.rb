class CreateRegistrations < ActiveRecord::Migration

  def self.up
    create_table :registrations do |t|
      t.string :surname
      t.string :first_name
      t.string :title
      t.string :company
      t.string :address
      t.string :city
      t.string :zip
      t.string :country
      t.string :phone
      t.string :fax
      t.string :email
      t.date :arrival
      t.date :departure
      t.string :accompagne
      t.string :ip
      t.integer :payment_id
      t.string :transaction
      t.integer :status
      t.integer :amount
      t.string :transmission_date
      t.string :payement_date
      t.string :payement_time
      t.datetime :date_cb
      t.integer :position

      t.timestamps
    end

    add_index :registrations, :id

    load(Rails.root.join('db', 'seeds', 'registrations.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "registrations"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/registrations"})
    end

    drop_table :registrations
  end

end
