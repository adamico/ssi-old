class Registration < ActiveRecord::Base
  acts_as_indexed :fields => [:surname, :first_name, :title, :company, :address, :city, :zip, :country, :phone, :fax, :email, :accompagne, :ip, :transaction, :transmission_date, :payement_date, :payement_time]

  validates :surname, :presence => true, :uniqueness => true

  belongs_to :payment
end