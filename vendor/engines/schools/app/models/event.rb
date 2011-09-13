class Event < ActiveRecord::Base
  acts_as_indexed :fields => [:title, :speaker]

  validates :title, :presence => true, :uniqueness => true

  belongs_to :school

  delegate :title, :to => :school, :prefix => true, :allow_nil => true

  def time
    self.when.strftime("%R")
  end
end
