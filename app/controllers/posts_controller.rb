class PostsController < ResourceController::Base
  before_filter :require_user, :except => [:show, :index]
  before_filter :check_permission, :except => [:show, :index]
  
  create do
    before { @post.user = current_user }
    flash "Post created!"
  end
  
  update do
    flash "Post updated!"
  end
  
  destroy do
    flash "Post delete!"
  end

end
