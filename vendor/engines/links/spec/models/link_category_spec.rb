require 'spec_helper'

describe LinkCategory do

  def reset_link_category(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @link_category.destroy! if @link_category
    @link_category = LinkCategory.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_link_category
  end

  context "validations" do
    
    it "rejects empty title" do
      LinkCategory.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_link_category
      LinkCategory.new(@valid_attributes).should_not be_valid
    end
    
  end

end