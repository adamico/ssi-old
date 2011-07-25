class Link < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :url]

  validates :title, :presence => true, :uniqueness => true
  belongs_to :link_category

  def self.uncategorized
    Link.where(:link_category_id => nil)
  end
end
