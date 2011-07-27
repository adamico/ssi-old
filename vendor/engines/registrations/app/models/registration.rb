class Registration < ActiveRecord::Base
  include Humanizer
  attr_accessor :bypass_humanizer, :card_number, :card_verification
  if Rails.env.production?
    require_human_on :create, :unless => :bypass_humanizer
  end

  CARD_TYPES = [["Visa", "visa"], ["MasterCard", "master"], ["Discover", "discover"], ["American Express", "american_express"]]

  acts_as_indexed :fields => [:surname, :first_name, :title, :company, :address, :city, :zip, :country, :phone, :fax, :email, :accompagne, :ip, :transaction, :transmission_date, :payement_date, :payement_time]

  validates :surname, :presence => true

  validate :validate_card, :on => :create

  belongs_to :payment
  belongs_to :school
  has_many :transactions, :class_name => "RegistrationTransaction"

  delegate :name, :to => :payment, :prefix => true, :allow_nil => true
  delegate :title, :to => :school, :prefix => true

  def purchase
    response = STANDARD_GATEWAY.purchase(price_in_cents, credit_card, :ip => ip)
    transactions.create!(
      :action => "purchase",
      :amount => price_in_cents,
      :response => response)
    date_cb = Time.now if response.success?
    response.success?
  end

  def price_in_cents
    (school.price*100).round
  end

  def title_with_name
    [self.try(:title), first_name, surname].join(" ")
  end

  def online_transfer?
    payment_name == "online_transfer"
  end

  private

  def validate_card
    if credit_card
      unless credit_card.valid?
        credit_card.errors.full_messages.each do |message|
          errors.add_to_base message
        end
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => surname
    )
  end
end
