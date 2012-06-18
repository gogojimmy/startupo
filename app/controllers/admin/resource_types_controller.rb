class Admin::ResourceTypesController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @types = ResourceType.all
  end

  def new
    @type = ResourceType.new
  end

  def create
    @type = ResourceType.new(params[:resource_type])

    if @type.save
      flash[:notice] = I18n.t('action.create_successful')
      redirect_to admin_resource_type_path(@type)
    else
      render 'new'
    end
  end

  def edit
    @type = ResourceType.find(params[:id])
  end

  def update
    @type = ResourceType.find(params[:id])

    if @type.update_attributes(params[:resource_type])
      flash[:notice] = I18n.t('action.update_successful')
      redirect_to admin_resource_type_path(@type)
    else
      render 'edit'
    end
  end

  def show
    @type = ResourceType.find(params[:id])
  end

  def destroy
    @type = ResourceType.find(params[:id])
    @type.destroy
    flash[:notice] = I18n.t('action.destroy_successful')
    redirect_to admin_resource_types_path
  end
end
