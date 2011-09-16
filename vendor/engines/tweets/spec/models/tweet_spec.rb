require 'spec_helper'

describe Tweet do

  def reset_tweet(options = {})
    @valid_attributes = {
      :id => 1
    }

    @tweet.destroy! if @tweet
    @tweet = Tweet.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_tweet
  end

  context "validations" do
    
  end

end