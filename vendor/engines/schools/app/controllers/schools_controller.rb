class SchoolsController < ApplicationController
  before_filter :find_previous_schools
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @school in the line below:
    present(@page)
  end

  def registration
    @school = School.next
    present(@page)
  end

  def show
    @school = School.find(params[:id])
    events = @school.events
    @events_days = events.group_by { |event| event.when.beginning_of_day }

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @school in the line below:
    present(@page)
  end

protected

  def find_previous_schools
    @schools = School.previous
  end

  def find_page
    @page = Page.where(:link_url => "/schools").first
  end
end
