#encoding: utf-8
class OmniauthCallbacksController < ApplicationController
  def all
    if current_user
      if current_user.assign_omniauth(request.env["omniauth.auth"])
        redirect_to current_user, notice: "連結成功!"
      else
        flash[:warning] = "連結失敗，這個 Facebook 帳號已經被其他史塔波帳號使用"
        redirect_to current_user
      end
    else
      user = User.from_omniauth(request.env["omniauth.auth"])
      if user.persisted?
        sign_in_and_redirect user, notice: "登入成功!"
      else
        session["devise.user_attributes"] = user.attributes
        redirect_to new_user_registration_url
      end
    end
  end
  alias_method :facebook, :all
end
