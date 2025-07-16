class ApplicationController < ActionController::Base
  # Devise configuration
  before_action :set_locale, :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :clienttype, :category, :custom_category ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :clienttype, :category, :custom_category ])
  end

  def after_sign_in_path_for(resource)
    root_path(locale: I18n.locale)
  end

  def after_sign_up_path_for(resource)
    root_path(locale: I18n.locale)
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
