class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def user_is_block?
    @user = current_user
    unless @user.account_active?
      reset_session
      redirect_to :action => 'new', :controller => 'users/sessions'
      flash.alert = "Your account is locked. A message has been sent to your email."
      
    end
  end
end
