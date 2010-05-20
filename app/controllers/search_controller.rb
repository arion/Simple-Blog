class SearchController < ApplicationController

  def index
    @posts = Post.search(params[:query])
  end

  def by_tag
    @posts = Post.find_tagged_with(params[:tag])
    render :template => "posts/index"
  end
  
  def by_category
    @posts = Post.find_all_by_category_id(params[:category_id])
    render :template => "posts/index"
  end

end
