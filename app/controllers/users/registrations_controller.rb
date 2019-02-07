# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :user_is_block?, :only => [:show, :edit, :update, :destoy]
  before_action :define_user, only: [:show, :edit, :update]
  # GET /resource/sign_up
  # def new
  #   @user = User.new
  #   @user_profession = @user.professions.build(user_params[:professions_attributes])
  # end

  def show
    respond_to do |format|
      format.html
      format.json { render :json => @user }
    end
  end

  # POST /resource
  # def create
  #   super &&
  #   @user = User.create(user_params)
  # end

  # GET /resource/edit
  def edit
    respond_to do |format|
      format.html
      format.json { render :json => @user }
    end
  end

  # PUT /resource
  def update
    @user.update!(user_params)
    redirect_to :action => 'show', :controller => 'users/registrations'
  end


  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end
  private

  def define_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :avatar, :about_me, profession_ids: [])
  end


# , address_attributes: [:id, :country, :city, :street, :home_number, :_destroy]
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
