class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

#devise: paramsで送られてきた値を許可設定する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account_name, :birth_date, :sex, :spouse, :children, :account_name])
  end

end
