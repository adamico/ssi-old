module Admin
  class EventsController < Admin::BaseController
    before_filter :find_all_schools,
                  :only => [:new, :edit, :create, :update]
    before_filter :find_next_school

    crudify :event, :xhr_paging => true,
            :order => "starts_at DESC",
            :sortable => false

    def new
      @event = Event.new(:school_id => params[:school])
      @school = School.find(params[:school])
    end
    protected

    def find_next_school
      @school = School.next
    end

    def find_all_events
      @events = @school.events.order('starts_at')
    end
    def find_all_schools
      @schools = School.all
    end
  end
end
