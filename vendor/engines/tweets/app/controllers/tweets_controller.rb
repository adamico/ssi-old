class TweetsController < ApplicationController

  before_filter :find_all_tweets
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @tweet in the line below:
    present(@page)
  end

  def show
    @tweet = Tweet.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @tweet in the line below:
    present(@page)
  end

protected

  def find_all_tweets
    @tweets = Tweet.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/tweets").first
  end

end
