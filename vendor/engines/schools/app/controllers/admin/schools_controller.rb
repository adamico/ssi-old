module Admin
  class SchoolsController < Admin::BaseController

    crudify :school, :xhr_paging => true,
            :sortable => false, :order => "id ASC"

  end
end
