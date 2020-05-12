class LikesController < ApplicationController
  before_action :sign_in_requiredr, only: %i[create destroy]

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

end
