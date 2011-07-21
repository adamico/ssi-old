module Admin
  class RegistrationsController < Admin::BaseController

    crudify :registration,
            :title_attribute => 'surname', :xhr_paging => true, :order => "created_at DESC",
            :sortable => false

  end
end
