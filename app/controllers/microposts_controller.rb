class MicropostsController < ApplicationController
  before_action :sign_in_required, only: %i[timeline show edit create destroy]
  before_action :correct_user, only: %i[destroy]

  def index
    @microposts = Micropost.all.page(params[:page]).per(20)
  end

  def timeline
    @user = User.find(params[:id])

    relationships = Relationship.where(follower_id: params[:id])
    users = relationships.map do |relationship|
      User.find(relationship.followed_id)
    end
    users << @user

    microposts_id = []
    users.each do |user|
      user_microposts = Micropost.where(user_id: user.id)
      user_microposts.each do |micropost|
        microposts_id << micropost.id
      end
    end

    @microposts = Micropost.where(id: microposts_id).page(params[:page]).per(20)
    @micropost = current_user.microposts.build
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def show
    @user = User.find(Micropost.find(params[:id]).user_id)
    @micropost = Micropost.find(params[:id])
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to root_url, notice: '投稿しました'
    else
      flash[:alert] = if @micropost.content.empty?
        '投稿文を入力してください'
      elsif @micropost.content.length > 140
        '投稿は140文字以内で入力してください'
      else
        '投稿できませんでした'
      end
      redirect_to edit_micropost_path(id: @micropost.id)
    end
  end

  def update
  end

  def destroy
    @micropost.delete
    redirect_to request.referer || root_url, notice: '投稿を削除しました'
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :image, :image_cache)
  end

  def set_uesr
    @micropost = Micropost.find(param)
  end

  def correct_user
    @micropost = Micropost.find(params[:id])

    return if @micropost.user_id == current_user.id

    redirect_to root_url, alert: '投稿者以外は削除できません'
  end


end
