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
                        :what => @tweet.status_id)
        redirect_back_or_default("admin_tweets_url")
      else
        render :new
      end
    end

    def destroy
      title = @tweet.status_id
      if @tweet.destroy
        destroy_twitter_status(@tweet)
        flash.notice = t('destroyed', :scope => 'refinery.crudify', :what => title)
      end
      redirect_to admin_tweets_url
    end

    private

    #TODO: add a check for api limit before updating and return the response to the user
    def update_twitter_status(tweet_instance)
      status = Twitter.update(tweet_instance.body)
      tweet_instance.update_attribute(:status_id, status.id.to_i)
    end

    #TODO: returns a 404 http status when twitter status_id not found
    def destroy_twitter_status(tweet_instance)
      twit_status = tweet_instance.status_id.to_i
      if Twitter.status(twit_status)
        Twitter.status_destroy(twit_status)
      end
    end
  end
end
