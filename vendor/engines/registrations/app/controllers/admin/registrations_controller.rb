module Admin
  class RegistrationsController < Admin::BaseController

    crudify :registration,
            :title_attribute => 'surname', :xhr_paging => true,
            :sortable => false

  end
end
