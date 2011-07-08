Given /^I have no registrations$/ do
  Registration.delete_all
end

Given /^I (only )?have registrations titled "?([^\"]*)"?$/ do |only, titles|
  Registration.delete_all if only
  titles.split(', ').each do |title|
    Registration.create(:surname => title)
  end
end

Then /^I should have ([0-9]+) registrations?$/ do |count|
  Registration.count.should == count.to_i
end
