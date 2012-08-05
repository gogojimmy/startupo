#encoding: utf-8
class Admin::PostsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_admin!

  def index
    @posts = Post.paginate(:page => params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      flash[:notice] = "文章更新成功"
      redirect_to admin_post_path(@post)
    else
      render :edit
    end
  end

  def create
    @post = Post.new(params[:post])
    @post.author = current_user

    if @post.save
      flash[:notice] = "文章新增成功"
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    flash[:notice] = "文章刪除成功"
    redirect_to posts_path
  end
end
