class PayboxController < ApplicationController
  include Paybox::System::Rails::Integrity

  before_filter :find_registration
  before_filter :check_paybox_integrity!

  def ipn
    if params[:error] == "00000"
      logger.info "Successful Transaction : #{params.inspect}"
      @registration.update_attribute(:status, "accepted")
      logger.info "Updating registration #{@registration.id} status to 'accepted'"
    end
    render text: "OK"
  end

  def canceled
    @page = Page.find_by_link_url("/payment_canceled")
  end

  def refused
    @page = Page.find_by_link_url("/payment_refused")
  end

  def accepted
    @registration.update_attribute(:status, 1)
    @page = Page.find_by_link_url("/payment_accepted")
  end

  protected

  def find_registration
    @registration = Registration.find(params[:registration])
  end

end
