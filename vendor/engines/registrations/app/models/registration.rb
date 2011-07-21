class Registration < ActiveRecord::Base
  include Humanizer
  attr_accessor :bypass_humanizer
  if Rails.env.production?
    require_human_on :create, :unless => :bypass_humanizer
  end

  acts_as_indexed :fields => [:surname, :first_name, :title, :company, :address, :city, :zip, :country, :phone, :fax, :email, :accompagne, :ip, :transaction, :transmission_date, :payement_date, :payement_time]

  validates :surname, :presence => true

  belongs_to :payment
  belongs_to :school

  delegate :name, :to => :payment, :prefix => true, :allow_nil => true

  def title_with_name
    [self.try(:title), first_name, surname].join(" ")
  end
end
