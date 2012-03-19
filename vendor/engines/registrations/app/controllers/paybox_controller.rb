class PayboxController < ApplicationController
  include Paybox::System::Rails::Integrity

  before_filter :find_page, except: :ipn
  before_filter :check_paybox_integrity!, only: :ipn

  def ipn
    if params[:error] == "00000"
      # Yipee, the payment is confirmed!
      # ...
    end
    render :text => "OK"
  end

  def canceled
  end

  protected

  def find_page
    @page = Page.find_by_link_url("/payment")
  end
end
