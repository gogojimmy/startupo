class PostsController < ApplicationController

  def index
    @posts = Post.public_posts.paginate(:page => params[:page])
  end

  def show
    @post = Post.public_posts.find(params[:id])
    @title = @post.title
  end
end
