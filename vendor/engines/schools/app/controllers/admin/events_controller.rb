module Admin
  class EventsController < Admin::BaseController
    before_filter :find_all_schools,
                  :only => [:new, :edit, :create, :update]

    crudify :event, :xhr_paging => true

    def new
      @event = Event.new(:school_id => params[:school])
    end
    protected

    def find_all_schools
      @schools = School.all
    end
  end
end
