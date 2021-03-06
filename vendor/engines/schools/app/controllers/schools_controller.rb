class SchoolsController < ApplicationController
  before_filter :find_previous_schools
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @school in the line below:
    present(@page)
  end

  def next
    @school = School.next_or_imminent
    if @school
      events = @school.events
      @events_days = events.group_by { |event| event.starts_at.beginning_of_day }
      render :show
    else
      redirect_to root_path
    end
  end

  def show
    @school = School.find(params[:id])
    events = @school.events
    @events_days = events.group_by { |event| event.starts_at.beginning_of_day }

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @school in the line below:
    present(@page)
  end

protected

  def find_previous_schools
    @schools = School.previous.page(params[:page]).order("starts_at DESC")
  end

  def find_page
    @page = Page.where(:link_url => "/previous").first
  end
end
