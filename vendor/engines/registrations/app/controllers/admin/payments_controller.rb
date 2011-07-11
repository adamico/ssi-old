module Admin
  class PaymentsController < Admin::BaseController

    crudify :payment,
            :title_attribute => 'name', :xhr_paging => true

  end
end
