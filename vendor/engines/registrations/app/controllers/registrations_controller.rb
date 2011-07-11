class RegistrationsController < ApplicationController

  before_filter :find_page, :only => [:create, :new]

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(params[:registration])

    if @registration.save
      #TODO: add Registration notification and confirmation with a mailer
      redirect_to thank_you_registrations_url
    else
      render 'new'
    end
  end

  protected

  def find_page
    @page = Page.find_by_link_url("/registration")
  end
end