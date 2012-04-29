class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
    @title = I18n.t('user.manage_my_profile')
    if @user.confirmed_by.nil?
      flash[:notice] = I18n.t('user.not_yet_confirm')
    end
  end

  def edit
    @user = current_user
    @title = I18n.t('user.manage_my_profile')
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user), :notice => I18n.t('action.update_successful')
    else
      render :action => 'edit', :error => @user.errors
    end
  end
end
