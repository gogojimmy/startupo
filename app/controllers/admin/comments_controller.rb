class Admin::CommentsController < ApplicationController
  before_filter :authenticate_admin!

  def create
    @resource = Resource.find(params[:resource_id])
    @comment = @resource.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      flash[:notice] = I18n.t('comment.created_successful')
      redirect_to admin_resource_path(@resource)
    else
      flash[:warning] = I18n.t('comment.created_faild')
      redirect_to admin_resource_path(@resource)
    end
  end
end
