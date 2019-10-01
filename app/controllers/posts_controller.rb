class PostsController < ApplicationController
  
  def index
    @posts = Post.includes(:user).page(params[:page]).per(5).order(created_at: 'desc')
    @users = User.order(id: 'asc')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    unless @post.save
      render action: :new
    end
  end

  def edit
    get_post
  end

  def update
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      unless @post.update(post_params)
        render action: :edit
      end
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_path
  end

  def show
    get_post
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).merge(user_id: current_user[:id])
  end

  def get_post
    @post = Post.find(params[:id])
  end
end
