Given /^I have no link_categories$/ do
  LinkCategory.delete_all
end

Given /^I (only )?have link_categories titled "?([^\"]*)"?$/ do |only, titles|
  LinkCategory.delete_all if only
  titles.split(', ').each do |title|
    LinkCategory.create(:title => title)
  end
end

Then /^I should have ([0-9]+) link_categor[y|ies]+?$/ do |count|
  LinkCategory.count.should == count.to_i
end
