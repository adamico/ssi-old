class CreateSchools < ActiveRecord::Migration

  def self.up
    create_table :schools do |t|
      t.string :title
      t.date :starts_at
      t.date :ends_at
      t.string :place
      t.string :location
      t.integer :vignlieu_id
      t.decimal :price
      t.date :deadline
      t.text :extranight
      t.string :theme
      t.string :sub_theme
      t.string :organiser
      t.string :sub_organiser
      t.text :award
      t.text :intro_program
      t.text :publication
      t.string :state
      t.integer :position

      t.timestamps
    end

    add_index :schools, :id

    load(Rails.root.join('db', 'seeds', 'schools.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "schools"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/schools"})
    end

    drop_table :schools
  end

end
