Given /^I have posts titled (.+) in categories (.+)$/ do |titles, categories|
  categories.split(', ').each do |category|
    current_category = Category.create!(:title => category)
    titles.split(', ').each do |title|
      current_category.posts.build(:title => title, :content => 'test').save!
    end
  end
end

Given /^the following post records$/ do |table|  
  table.hashes.each do |hash| 
    Post.create!(hash)
  end  
end

Given /^I have 2 posts$/ do
  Post.count == 2
end

Then /^I should have 1 posts$/ do
  Post.count == 1
end

Given /^I have 2 comments$/ do
  Comment.count == 2
end

Then /^I should have 1 comment$/ do
  Comment.count == 1
end

Given /^I have 0 confrim comments$/ do
  Comment.count(:conditions => {:confirm => true}) == 2
end


Then /^I should have 1 confirm comment$/ do
  Comment.count(:conditions => {:confirm => true}) == 1
end

Given /^I have 0 comments$/ do
  Comment.destroy_all
end
