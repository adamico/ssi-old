module Admin
  class LinkCategoriesController < Admin::BaseController

    crudify :link_category, :xhr_paging => true

  end
end
