class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def user_is_block?
    @user = current_user
    unless @user.account_active?
      reset_session
      redirect_to :action => 'new', :controller => 'users/sessions'
      flash.alert = "Your account is locked. A message has been sent to your email."
      BlockUserEmailMailer.block_user(@user).deliver_now
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :about_me])
  end
end
