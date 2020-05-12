class LikesController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]

  def create
    @like = Like.new(user_id: current_user.id, micropost_id: params[:micropost.id])
    @like.save
    @micropost = Micropost.find_by(id: @like.micropost_id)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, micropost_id: params[:micropost.id])
    @micropost = Micropost.find(id: @like.micropost_id)
    @like.destroy
  end

  protected

  def logged_in_user
    return if user_signed_in?
    redirect_to new_user_session_url, alert: 'ログインまたはユーザー登録してください'
  end
end
