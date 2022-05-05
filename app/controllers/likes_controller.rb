class LikesController < ApplicationController
  def create
    like = Like.new(param_hash)
    redirect_back(fallback_location: user_path(id: param_hash[:author_id])) if like.save
  end

  private

  def param_hash
    { author_id: params[:user_id], post_id: params[:post_id] }
  end
end
