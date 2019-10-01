class UsersController < ApplicationController
   
  def show
    @posts = Post.includes(:user).where(user_id: params[:id]).order(id: 'desc')
    @users = User.order(id: 'asc')
  end

end
