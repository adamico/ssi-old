class RegistrationsController < ApplicationController

  before_filter :find_page, :only => [:create, :new, :edit, :update]
  before_filter :find_school

  def new
    @registration = Registration.new(:school_id => @school.id, :amount => @school.price * 100) if @school
  end

  def create
    @registration = Registration.new(params[:registration])
    @registration.ip = request.remote_ip

    if @registration.save
      success
    else
      render 'new'
    end
  end

  def edit
    @registration = Registration.find(params[:id])
  end

  def update
    @registration = Registration.find(params[:id])
    if @registration.update_attributes(params[:registration])
      success
    else
      render 'edit'
    end
  end

  protected

  def find_page
    @page = Page.find_by_link_url("/registration")
  end

  def find_school
    @school = School.try(:next_or_imminent)
  end

  def success
    RegistrationMailer.registration_confirmation(@registration).deliver
    @page = Page.find_by_link_url("/thank_you", :include => [:parts, :slugs])
    render 'thank_you'
  end
end
