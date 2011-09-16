class CreateTweets < ActiveRecord::Migration

  def self.up
    create_table :tweets do |t|
      t.text :body
      t.integer :status_id
      t.integer :position

      t.timestamps
    end

    add_index :tweets, :id

    load(Rails.root.join('db', 'seeds', 'tweets.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "tweets"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/tweets"})
    end

    drop_table :tweets
  end

end
