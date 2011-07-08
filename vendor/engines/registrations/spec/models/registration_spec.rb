require 'spec_helper'

describe Registration do

  def reset_registration(options = {})
    @valid_attributes = {
      :id => 1,
      :surname => "RSpec is great for testing too"
    }

    @registration.destroy! if @registration
    @registration = Registration.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_registration
  end

  context "validations" do
    
    it "rejects empty surname" do
      Registration.new(@valid_attributes.merge(:surname => "")).should_not be_valid
    end

    it "rejects non unique surname" do
      # as one gets created before each spec by reset_registration
      Registration.new(@valid_attributes).should_not be_valid
    end
    
  end

end