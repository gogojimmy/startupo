class Admin::UsersController < ApplicationController
  before_filter :authenticate_admin!

  def unconfirmed_users
    @users = User.unconfirmed_users.paginate(:page => params[:page])
  end

  def confirm_user
    @user = User.find(params[:id])
    if @user.update_attributes(:confirmed_by => current_user)
      flash[:notice] = I18n.t('admin.message.user_confirmed')
      redirect_to :back
    else
      flash[:error] = I18n.t('admin.message.user_confirm_failed')
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
