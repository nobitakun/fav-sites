class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  private
  
  def require_user_logged_in
    unless user_signed_in?
      store_location
      flash[:danger] = 'ログインしてください'
      redirect_to new_user_session_url
    end
  end
  
  def require_admin_logged_in
    unless user_signed_in? && current_user.admin
      store_location
      flash[:danger] = 'ログインしてください'
      redirect_to new_user_session_url
    end
  end
  
  def require_root_logged_in
    unless user_signed_in? && current_user.root
      store_location
      flash[:danger] = 'ログインしてください'
      redirect_to new_user_session_url
    end
  end
end
