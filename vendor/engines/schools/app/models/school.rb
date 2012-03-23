class School < ActiveRecord::Base
  acts_as_indexed :fields => [:title, :place, :location, :extranight, :theme, :sub_theme, :organiser, :sub_organiser, :award, :intro_program, :publication, :state]
  #TODO: add pdf export for programmed events and registration form
  validates :title, :presence => true, :uniqueness => true

  belongs_to :vignlieu, :class_name => 'Image'
  has_many :events, :dependent => :destroy
  has_many :registrations, :dependent => :destroy

  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  self.per_page = 4

  def self.previous
    with_state(:closed)
  end

  def self.announced
    with_state(:announced).last
  end

  def self.next_or_imminent
    self.next || self.imminent
  end

  def self.imminent
    with_state(:imminent).last
  end

  def self.next
    with_state(:active).first
  end

  def price_without_vat
    (price / 1.196).round(2)
  end

  def when_and_where
    if cancelled?
      "CANCELLED"
    elsif announced?
      month_and_year + " #{place}"
    else
      period + " (#{place})"
    end
  end

  def month_and_year
    "#{starts_at.strftime'%B'} #{starts_at.year}"
  end

  def period
    "#{starts_at.day}-#{ends_at.day} #{starts_at.strftime'%B'} #{starts_at.year}"
  end

  def expired?
    Time.now.to_date >= deadline
  end

  # state machines
  ### default state machine 'state'
  #TODO: add a cron task to close schools after deadline

  STATES = %w(draft announced imminent active closed cancelled)

  state_machine :initial => :draft do
    event :announce do
      transition :draft => :announced
    end
    event :prepare do
      transition :announced => :imminent
    end
    event :activate do
      transition :imminent => :active
    end
    event :close do
      transition :active => :closed
    end
    event :cancel do
      transition all - [:cancelled, :closed] => :cancelled
    end
  end
end
