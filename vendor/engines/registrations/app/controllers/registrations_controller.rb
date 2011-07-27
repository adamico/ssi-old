class RegistrationsController < ApplicationController

  before_filter :find_page, :only => [:create, :new]
  before_filter :find_school


  def new
    @registration = Registration.new(:school_id => @school.id, :amount => @school.price) if @school
  end

  def create
    @registration = Registration.new(params[:registration])
    @registration.ip = request.remote_ip

    if @registration.save
      #TODO: add branch for online transfer with sips/atos module
      success
    else
      render 'new'
    end
  end

  protected

  def find_page
    @page = Page.find_by_link_url("/registration")
  end

  def find_school
    @school = School.try(:next)
  end

  def success
    RegistrationMailer.registration_confirmation(@registration).deliver
    @page = Page.find_by_link_url("/thank_you", :include => [:parts, :slugs])
    render 'thank_you'
  end
end
