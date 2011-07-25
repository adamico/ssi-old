class LinkCategoriesController < ApplicationController

  def index
    @link_categories = LinkCategory.order('position ASC')
    @other_links = Link.uncategorized
    @page = Page.where(:link_url => "/link_categories").first
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @link_category in the line below:
    present(@page)
  end
end
