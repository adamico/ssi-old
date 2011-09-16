module NavigationHelpers
  module Refinery
    module Tweets
      def path_to(page_name)
        case page_name
        when /the list of tweets/
          admin_tweets_path

         when /the new tweet form/
          new_admin_tweet_path
        else
          nil
        end
      end
    end
  end
end
