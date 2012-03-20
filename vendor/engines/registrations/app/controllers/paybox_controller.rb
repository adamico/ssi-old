class PayboxController < ApplicationController
  include Paybox::System::Rails::Integrity

  before_filter :find_page, except: :ipn
  before_filter :find_registration
  before_filter :check_paybox_integrity!, only: :ipn

  def ipn
    if params[:error] == "00000"
      # Yipee, the payment is confirmed!
      # ...
    else
      render text: "OK"
    end
  end

  def canceled
  end

  def refused
  end

  def accepted
  end

  protected

  def find_registration
    @registration = Registration.find(params[:registration])
  end

  def find_page
    @page = Page.find_by_link_url("/payment")
  end
end
