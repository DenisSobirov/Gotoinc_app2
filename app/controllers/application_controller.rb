class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :user_is_block?

  protected

  def :user_is_block?
    @user = current_user
    unless @user.account_active?
      redirect_to redirect_to :action => 'show', :controller => 'users/registrations'
      flash.alert = ""
  end
end
