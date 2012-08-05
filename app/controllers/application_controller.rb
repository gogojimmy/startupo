class ApplicationController < ActionController::Base
  before_filter :authenticate if Rails.env.staging?
  protect_from_forgery
  before_filter :set_locale

  def authenticate_admin!
    if authenticate_user! && current_user.is_admin?
      return true
    else
      flash[:warning] = I18n.t('error.you_are_not_admin')
      redirect_to :root
    end
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
       username == "startupo" && password == "isthebest"
     end
  end

  private
  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

end
