require 'spec_helper'

describe Event do
  it {should_not be_valid}

  it "should require a title" do
    subject.title = "value for title"
    subject.should be_valid
  end

  it "should require a unique title" do
    subject.title = "value for title"
    subject.save!
    Event.new(:title => subject.title).should_not be_valid
  end

end
