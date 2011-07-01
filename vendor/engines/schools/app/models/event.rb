class Event < ActiveRecord::Base
  acts_as_indexed :fields => [:title, :speaker]

  validates :title, :presence => true, :uniqueness => true

  belongs_to :school

  def time
    self.when.strftime("%R")
  end
end
