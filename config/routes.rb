ActionController::Routing::Routes.draw do |map|

  map.resources :posts do |posts|
    posts.resources :comments, :controller => 'posts/comments', :only => [:create, :update, :destroy]
  end
  map.resource :user_session, :only => [:new, :create, :destroy]
  map.resources :users, :only => [:new, :create]
  
  map.root :controller => 'posts', :action => 'index'
  
  map.with_options :controller => :user_sessions do |user_sessions|
    user_sessions.login "/login", :action => "new"
    user_sessions.logout "/logout", :action => "destroy"
  end
  
  map.by_tag '/tag/:tag', :controller => :search, :action => :by_tag
  map.by_category '/category/:category_id', :controller => :search, :action => :by_category
  map.search '/search', :controller => :search, :action => :index, :method => :post
  
  map.register '/register/:activation_code', :controller => 'activations', :action => 'new'
  map.activate '/activate/:id', :controller => 'activations', :action => 'create'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
