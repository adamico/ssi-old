class Event < ActiveRecord::Base
  acts_as_indexed :fields => [:title, :speaker]

  validates :title, :presence => true

  belongs_to :school

  delegate :title, :to => :school, :prefix => true, :allow_nil => true

  def time
    self.starts_at.strftime("%R")
  end
end
