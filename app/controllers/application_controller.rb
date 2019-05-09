class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    added_attrs = [ :name, :email, :password, :password_confirmation　]
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
  
  private
  
  def require_admin_logged_in
    unless user_signed_in? && current_user.admin
      flash[:danger] = 'ログインしてください'
      redirect_to new_user_session_url
    end
  end
  
  def require_root_logged_in
    unless user_signed_in? && current_user.root
      flash[:danger] = 'ログインしてください'
      redirect_to new_user_session_url
    end
  end
  
end
