class School < ActiveRecord::Base
  acts_as_indexed :fields => [:title, :place, :location, :extranight, :theme, :sub_theme, :organiser, :sub_organiser, :award, :intro_program, :publication, :state]

  validates :title, :presence => true, :uniqueness => true

  belongs_to :vignlieu, :class_name => 'Image'
  has_many :events, :dependent => :destroy

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

  # state machines
  ### default state machine 'state'

  def expired?
    Time.now.to_date >= deadline
  end

  state_machine :initial => :draft do
    event :announce do
      transition :draft => :announced
    end
    event :open do
      transition :announced => :active
    end
    state :draft
    state :announced
    state :active
  end
end
