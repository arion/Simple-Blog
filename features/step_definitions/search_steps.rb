Given /^I go on category number (.+)$/ do |category_id|
  visit "/category/#{category_id}"
end

Given /^I go on tag "(.+)"$/ do |tag|
  visit "/tag/#{tag}"
end

Given /^a posts have valid tags$/ do
  Post.first.update_attribute(:tag_list, 'tag1')
  Post.last.update_attribute(:tag_list, 'tag1')
end

Given 'the Sphinx indexes are updated' do
  # Update all indexes
  ThinkingSphinx::Test.index
  sleep(0.25) # Wait for Sphinx to catch up
end
