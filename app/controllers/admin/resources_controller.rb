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
    @resource = Resource.find(params[:id])
    @resource.assign_attributes(params[:resource])
    if  @resource.valid?
      @resource.update_comment(current_user)
      @resource.save
      flash[:notice] = I18n.t('resource.message.update_successful')
      redirect_to admin_resource_path(@resource)
    else
      render 'edit'
    end
  end

  def show
    @resource = Resource.find(params[:id])
    @admins = User.admins
    @comment = Comment.new(:resource => @resource)
  end

  def my_responsibility
    @resources = Resource.my_responsibility(current_user).
                          paginate(:page => params[:page])
  end

  def matchers
    @resource = Resource.find(params[:resource_id])
    @matchers = @resource.matchers
  end

  def match
    @resource = Resource.find(params[:resource_id])
    if @resource.update_match_status(params[:matcher], params[:status])
      flash[:notice] = I18n.t('action.update_successful')
    end
    redirect_to admin_resource_matchers_path(@resource)
  end

  def add_matcher
    @resource = Resource.find(params[:resource_id])
    @matchers = User.all
  end

  def update_matchers
    @resource = Resource.find(params[:resource_id])
    @resource.add_matcher()
  end

end
