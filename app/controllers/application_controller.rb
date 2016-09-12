class ApplicationController < ActionController::Base
  include Permissions

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :about_myself, :country, :city, :address, :admin,
                                                       :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :about_myself, :country, :city, :address, :admin,
                                                       :email, :password, :password_confirmation, :avatar])
  end

  private

  def set_locale
    I18n.locale = params[:locale] ||
    http_accept_language.compatible_language_from(I18n.available_locales.map(&:to_s)) ||
    I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

end
