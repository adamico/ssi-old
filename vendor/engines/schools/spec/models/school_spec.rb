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

end