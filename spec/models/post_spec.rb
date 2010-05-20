require 'spec_helper'

describe Post do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :content => "value for content",
      :user_id => 1,
      :category_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Post.create!(@valid_attributes)
  end
end
