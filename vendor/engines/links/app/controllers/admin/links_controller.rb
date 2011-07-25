module Admin
  class LinksController < Admin::BaseController

    before_filter :find_all_link_categories,
                  :only => [:new, :edit, :create, :update]
    crudify :link, :xhr_paging => true

    protected

    def find_all_link_categories
      @link_categories = LinkCategory.order('position ASC')
    end
  end
end
