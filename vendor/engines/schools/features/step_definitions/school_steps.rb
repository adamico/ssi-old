Given /^I have no schools$/ do
  School.delete_all
end

Given /^I (only )?have schools titled "?([^\"]*)"?$/ do |only, titles|
  School.delete_all if only
  titles.split(', ').each do |title|
    School.create(:title => title)
  end
end

Then /^I should have ([0-9]+) schools?$/ do |count|
  School.count.should == count.to_i
end
