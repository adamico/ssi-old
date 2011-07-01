module Admin
  class SchoolsController < Admin::BaseController
    crudify :school, :xhr_paging => true,
            :sortable => false
  end
end
