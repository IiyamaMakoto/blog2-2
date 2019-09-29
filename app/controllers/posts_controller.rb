class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order(id: 'desc')
    @users = User.order(id: 'asc')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text).merge(user_id: current_user[:id])
  end
end
