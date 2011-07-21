class RegistrationsController < ApplicationController

  before_filter :find_page, :only => [:create, :new]
  before_filter :find_school

  def thank_you
    @page = Page.find_by_link_url("/thank_you", :include => [:parts, :slugs])
  end

  def new
    @registration = Registration.new(:school_id => @school.id) if @school
  end

  def create
    @registration = Registration.new(params[:registration])

    if @registration.save
      #TODO: add branch for online transfer with sips/atos module
      #TODO: add mailer stuff
      @page = Page.find_by_link_url("/thank_you", :include => [:parts, :slugs])
      render 'thank_you'
    else
      render 'new'
    end
  end

  protected

  def find_page
    @page = Page.find_by_link_url("/registration")
  end

  def find_school
    @school = School.try(:next).first
  end
end
