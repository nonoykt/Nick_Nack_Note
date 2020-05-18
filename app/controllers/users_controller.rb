class UsersController < ApplicationController
  before_action :sign_in_required, only: %i[timeline show following followers]

  def index
    @users = User.all.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @microposts = Micropost.where(user_id: @user.id).page(params[:page]).per(20)
    @micropost = current_user.microposts.build
  end

  def following
    @title = "フォロー一覧"
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(20)
    render 'show_follow'
  end

  def followers
    @title = "フォロワー一覧"
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(20)
    render 'show_follow'
  end
end
