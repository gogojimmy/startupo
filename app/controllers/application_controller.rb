class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin!
    if authenticate_user! && current_user.is_admin?
      return true
    else
      flash[:warning] = I18n.t('error.you_are_not_admin')
      redirect_to :root
    end
  end
end
