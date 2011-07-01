class School < ActiveRecord::Base
  acts_as_indexed :fields => [:title, :place, :location, :extranight, :theme, :sub_theme, :organiser, :sub_organiser, :award, :intro_program, :publication, :state]

  validates :title, :presence => true, :uniqueness => true

  belongs_to :vignlieu, :class_name => 'Image'
  has_many :events, :dependent => :destroy

  default_scope order('id DESC')

  def self.previous
    all.reject {|school| school === School.next}
  end

  def self.next
    last
  end
end
