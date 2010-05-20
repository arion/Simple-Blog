class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :posts
  has_many :comments
  
  def admin?
    User.first == self
  end
  
  def active?
    active
  end
  
  def activate!
    self.active = true
    save
  end

  def deliver_activation_instructions!
    reset_perishable_token!
    Notifier.deliver_activation_instructions(self)
  end

  def deliver_activation_confirmation!
    reset_perishable_token!
    Notifier.deliver_activation_confirmation(self)
  end


end
