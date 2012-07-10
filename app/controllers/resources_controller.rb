class ResourcesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index

    if params[:type]
      @resources = Resource.by_type(params[:type])
    else
      @resources = Resource.scoped
    end

    if params[:user_id] && is_owner_or_admin?(params[:user_id])
      @resources = @resources.by_user_id(params[:user_id]).
                            paginate(:page => params[:page])
    else
      @resources = @resources.public_resources.paginate(:page => params[:page])
    end

  end

  def new
    @resource = Resource.new
    @user = current_user
  end

  def edit
    @resource = current_user.resources.find(params[:id])
  end

  def create
    @resource = current_user.resources.build(params[:resource])
    @resource.state = "pending"

    if @resource.save
      flash[:notice] = I18n.t('resource.message.request_sent')
      redirect_to resources_path
    else
      render 'new'
    end
  end

  def update
    @resource = Resource.find(params[:id])
    if @resource.update_attributes(params[:resource])
      flash[:notice] = I18n.t('resource.message.request_updated')
      redirect_to resources_path
    else
      render 'new'
    end
  end

  def show
    @resource = Resource.find(params[:id])
    @title = @resource.title
  end

  def i_want_it
    @resource = Resource.find(params[:resource_id])
    @resource.i_want_it(current_user)
    @resource.delay.send_interest_mail(current_user)
    flash[:notice] = I18n.t('resource.message.add_to_wants')
    redirect_to @resource
  end

  protected

  def is_owner_or_admin?(user_id)
    ( user_id == current_user.id ) || current_user.is_admin?
  end

end
