class CreateLinkCategories < ActiveRecord::Migration

  def self.up
    create_table :link_categories do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end

    add_index :link_categories, :id

    load(Rails.root.join('db', 'seeds', 'link_categories.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "link_categories"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/link_categories"})
    end

    drop_table :link_categories
  end

end
