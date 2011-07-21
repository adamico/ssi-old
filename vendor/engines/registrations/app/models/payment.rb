class Payment < ActiveRecord::Base
  acts_as_indexed :fields => [:name]

  validates :name, :presence => true, :uniqueness => true
  has_many :registrations
end
