class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[show following followers]

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @microposts = Micropost.where(user_id: @user.id).page(params[:page]).per(20)
    @micropost = current_user.microposts.build
  end

  def following
    @title = "フォロー一覧"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "フォロワー一覧"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
