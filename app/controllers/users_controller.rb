class UsersController < ResourceController::Base
  before_filter :require_no_user, :only => [:new, :create]
  
  def create
    @user = User.new(params[:user])

    if @user.save_without_session_maintenance
      @user.deliver_activation_instructions!
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to root_url
    else
      render :action => :new
    end
  end
  
end