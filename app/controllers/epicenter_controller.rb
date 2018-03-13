class EpicenterController < ApplicationController
  def feed
    array_of_users = current_user.following
    array_of_users << current_user.id
    @following_caws = Caw.where(user_id: array_of_users)
  end

  def show_user
    @user = User.find(params[:id])
  end

  def now_following
  end

  def unfollow
  end

  def tag_caws
    @tag = Tag.find(params[:id])
  end
end
