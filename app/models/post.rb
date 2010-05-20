class Post < ActiveRecord::Base
  acts_as_taggable
  acts_as_commentable
  
  belongs_to :category
  belongs_to :user
  
  default_scope :order => 'created_at DESC'
  
  validates_presence_of :category_id, :title, :content
  
  define_index do
    indexes :title
    indexes :content
    indexes category.title, :as => :category
    indexes user.email, :as => :author
    
    has :category_id
    
    set_property :delta => true
  end
end
