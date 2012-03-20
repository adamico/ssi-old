module Admin
  class RegistrationsController < Admin::BaseController

    crudify :registration,
            :title_attribute => 'surname', :xhr_paging => true, :order => "created_at DESC",
            :sortable => false

    def index
      @school = School.next
      @registrations = @school.registrations.order("created_at DESC").paginate(:page => params[:page])
    end
  end
end
