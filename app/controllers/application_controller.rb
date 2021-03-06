class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  private

  def sign_in_required
    unless user_signed_in?
      redirect_to new_user_session_url, alert: 'ログインまたはアカウント登録してください'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username image])
  end
end
