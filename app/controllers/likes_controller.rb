class LikesController < ApplicationController

  def like
    Like.create story_id: params[:id], user_id: @current_user.id, whisky: params[:whisky]

    redirect_to @story
  end

  def unlike
    Like.find_by(story_id: params[:id], user_id: @current_user.id).destroy

    redirect_to @story
  end
end
