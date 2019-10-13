class UsersController < ApplicationController
   
  def show
    @posts = Post.includes(:user).where(user_id: params[:id]).order(id: 'desc')
    @users = User.order(id: 'asc')
    if @posts == []
      @posts = Post.new(title: "投稿なし", text: "このユーザーの投稿はまだありません")
    end
  end

end
