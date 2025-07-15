class ApplicationController < ActionController::Base
  # Set the locale before every action
  before_action :set_locale

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user  # Make current_user available in views

  private

  # Set the locale based on the URL parameter or default to 'en'
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
