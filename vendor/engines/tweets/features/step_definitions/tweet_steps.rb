Given /^I have no tweets$/ do
  Tweet.delete_all
end


Then /^I should have ([0-9]+) tweets?$/ do |count|
  Tweet.count.should == count.to_i
end
