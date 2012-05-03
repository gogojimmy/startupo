class Admin::AdminCategoriesController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @categories = AdminCategory.all
  end

  def new
    @category = AdminCategory.new
  end

  def edit
    @category = AdminCategory.find(params[:id])
  end

  def create
    @category = AdminCategory.new(params[:admin_category])

    if @category.save
      flash[:notice] = I18n.t('action.create_successful')
      redirect_to admin_admin_categories_path
    else
      render 'new'
    end
  end

  def update
    @category = AdminCategory.find(params[:id])

    if @category.update_attributes(params[:admin_category])
      flash[:notice] = I18n.t('action.update_successful')
      redirect_to admin_admin_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = AdminCategory.find(params[:id])
    @category.destroy
    flash[:notice] = I18n.t('action.destroy_successful')
    redirect_to admin_admin_categories_path
  end
end
