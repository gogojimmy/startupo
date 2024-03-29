#encoding: utf-8
class Admin::UsersController < ApplicationController
  layout 'admin'
  before_filter :authenticate_admin!

  def unconfirmed_users
    @users = User.unconfirmed_users.paginate(:page => params[:page])
  end

  def index
    @users = User.scoped
    if params[:type]
      @users = @users.by_industry(params[:type])
    end
    @users = @users.paginate(:page => params[:page])
  end

  def confirm_user
    @user = User.find(params[:id])
    if @user.update_attributes(:confirmed_by => current_user.id)
      flash[:notice] = I18n.t('admin.message.user_confirmed')
      redirect_to :back
    else
      flash[:error] = I18n.t('admin.message.user_confirm_failed')
      redirect_to :back
    end
  end

  def add_to_admin
    @user = User.find(params[:id])
    if @user.update_attributes(:is_admin => true)
      flash[:notice] = "提昇成功"
      redirect_to :back
    else
      flash[:error] = "提昇失敗"
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
