class RelationshipsController < ApplicationController
  before_action :sign_in_required, only: %i[create destroy]

  def create
    user = User.find(params[:followed_id])
    currrent_user.follow(user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
