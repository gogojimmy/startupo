class Admin::ResourcesController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @resources = Resource.paginate(:page => params[:page])
  end

  def unapproved_resources
    @resources = Resource.unapproved.paginate(:page => params[:page])
  end

  def new
    @resource = Resource.new
  end

  def edit
    @resource = Resource.find(params[:id])
    @admins = User.admins
  end

  def create
    @resource = current_user.resources.build(params[:resource])
    @resource.assign_to = current_user

    if @resource.save
      flash[:notice] = I18n.t('resource.message.create_successful')
      redirect_to admin_resource_path(@resource)
    else
      render 'new'
    end
  end

  def update
    ap "here?"
    @resource = Resource.find(params[:id])
    if @resource.update_attributes(params[:resource])
      flash[:notice] = I18n.t('resource.message.update_successful')
      redirect_to admin_resource_path(@resource)
    else
      render 'edit'
    end
  end

  def show
    @resource = Resource.find(params[:id])
    @admins = User.admins
  end

  def my_responsibility
    @resources = Resource.my_responsibility(current_user).
                          paginate(:page => params[:page])
  end

end
