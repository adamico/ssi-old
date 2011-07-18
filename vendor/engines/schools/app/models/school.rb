class School < ActiveRecord::Base
  acts_as_indexed :fields => [:title, :place, :location, :extranight, :theme, :sub_theme, :organiser, :sub_organiser, :award, :intro_program, :publication, :state]
  #TODO: add pdf export for programmed events and registration form
  validates :title, :presence => true, :uniqueness => true

  belongs_to :vignlieu, :class_name => 'Image'
  has_many :events, :dependent => :destroy

  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  def self.previous
    all.reject {|school| school === School.next}
  end

  def self.next
    last
  end

  def price_without_vat
    (price / 1.196).round(2)
  end

  def when_and_where
    period + " (#{place})"
  end

  def period
    "#{starts_at.day}-#{ends_at.day} #{starts_at.strftime'%B'} #{starts_at.year}"
  end

  def expired?
    Time.now.to_date >= deadline
  end

  # state machines
  ### default state machine 'state'

  STATES = %w(draft announced active closed)

  state_machine :initial => :draft do
    event :announce do
      transition :draft => :announced
    end
    event :open do
      transition :announced => :active
    end
    event :close do
      transition :active => :closed
    end
  end
end
