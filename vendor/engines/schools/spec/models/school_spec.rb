require 'spec_helper'

describe School do

  def reset_school(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @school.destroy! if @school
    @school = School.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_school
  end

  context "validations" do
    it "rejects empty title" do
      School.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_school
      School.new(@valid_attributes).should_not be_valid
    end
  end

  describe ".previous" do
    it "should list all schools but the current" do
      last_school = School.create(:title => "a title")
      last_school.activate!
      School.previous.should_not include(last_school)
    end
  end

  describe ".next" do
    it "should return last school" do
      @school.activate!
      School.next.should === @school
    end
  end

  describe "#price_without_vat" do
    it "should return price excluding 19.6% VAT" do
      @school.price = 119.6
      @school.price_without_vat.should == 100.00
    end
  end

  describe "#when_and_where" do
    it "should return period and place" do
      @school.starts_at = Time.new(2011,7,1).to_date
      @school.ends_at = Time.new(2011,7,3).to_date
      @school.place = "place"
      @school.when_and_where.should == "1-3 July 2011 (place)"
    end
  end

  describe "#period" do
    it "should return d-d month year" do
      @school.starts_at = Time.new(2011,7,1).to_date
      @school.ends_at = Time.new(2011,7,3).to_date
      @school.period == "1-3 July 2011"
    end
  end

  describe "#expired?" do
    it "should return true if deadline is passed" do
      @school.deadline = Time.new(2011,7,1).to_date
      @school.expired?.should be_true
    end
  end
end
