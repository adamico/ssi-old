class CreatePayments < ActiveRecord::Migration

  def self.up
    create_table :payments do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_index :payments, :id

    load(Rails.root.join('db', 'seeds', 'payments.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "payments"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/payments"})
    end

    drop_table :payments
  end

end
