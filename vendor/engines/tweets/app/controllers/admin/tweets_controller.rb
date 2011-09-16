module Admin
  class TweetsController < Admin::BaseController

    crudify :tweet, :xhr_paging => true,
      :order => "created_at DESC",
      :sortable => false

    def create
      @tweet = Tweet.new(params[:tweet])

      if @tweet.save
        update_twitter_status(@tweet)

        flash.notice = t('refinery.crudify.created',
                        :what => "#{@tweet.status_id}")
        redirect_back_or_default("admin_tweets_url")
      else
        render :new
      end
    end

    private

    def update_twitter_status(tweet_instance)
      #TODO: a bit of rescue should be added here...
      status = Twitter.update(tweet_instance.body)
      tweet_instance.update_attribute(:status_id, status.id)
    end
  end
end
