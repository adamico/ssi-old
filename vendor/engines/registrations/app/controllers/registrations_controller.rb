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
      if @registration.online_transfer? 
        if @registration.purchase
          success
        else
          render 'failure'
        end
      else
        #TODO: refactor this, ugly!
        success
      end
    else
      render 'new'
    end
  end

  protected

  def success
    RegistrationMailer.registration_confirmation(@registration).deliver
    @page = Page.find_by_link_url("/thank_you",
                                  :include => [:parts, :slugs])
    render 'thank_you'
  end

  def find_page
    @page = Page.find_by_link_url("/registration")
  end

  def find_school
    @school = School.try(:next)
  end
end
