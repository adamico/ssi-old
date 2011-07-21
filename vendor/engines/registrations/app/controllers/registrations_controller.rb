class RegistrationsController < ApplicationController

  before_filter :find_page, :only => [:create, :new]
  before_filter :find_school

  def thank_you
    @page = Page.find_by_link_url("/thank_you", :include => [:parts, :slugs])
  end

  def new
    @registration = Registration.new(:school_id => @school) if @school
  end

  def create
    @registration = Registration.new(params[:registration])

    if Rails.env.development?
      if @registration.save
        @page = Page.find_by_link_url("/thank_you", :include => [:parts, :slugs])
        render 'thank_you'
      else
        render 'new'
      end
    else
      if verify_recaptcha(:model => @registration) && @registration.save
        #TODO: add mailer stuff
        redirect_to thank_you_url
      else
        render 'new'
      end
    end
  end

  protected

  def find_page
    @page = Page.find_by_link_url("/registration")
  end

  def find_school
    next_school = School.next
    @school = next_school.try(:active?) ? next_school : nil
  end
end
