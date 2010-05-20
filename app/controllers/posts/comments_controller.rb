class Posts::CommentsController < ApplicationController
  before_filter :check_permission, :except => [:create]
  before_filter :find_comment, :only => [:update, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user = current_user if logged_in?
    if @comment.save
      flash[:notice] = "Comment created!"
    else
      flash[:error] = "Comment can't created!"
    end
    redirect_to post_path(@post)
  end
  
  def update
    if @comment.update_attribute(:confirm, true)
      flash[:notice] = "Comment confirmed!"
    else
      flash[:error] = "Comment can't confirmed!"
    end
    redirect_to post_path(@comment.commentable)
  end
  
  def destroy
    if @comment.delete
      flash[:notice] = "Comment delete!"
    else
      flash[:error] = "Comment can't delete!"
    end
    redirect_to post_path(@comment.commentable)
  end

private

  def find_comment
    @comment = Comment.find(params[:id])
  end

end
