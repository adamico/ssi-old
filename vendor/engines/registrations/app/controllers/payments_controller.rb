class PaymentsController < ApplicationController

  before_filter :find_all_payments
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @payment in the line below:
    present(@page)
  end

  def show
    @payment = Payment.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @payment in the line below:
    present(@page)
  end

protected

  def find_all_payments
    @payments = Payment.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/payments").first
  end

end
