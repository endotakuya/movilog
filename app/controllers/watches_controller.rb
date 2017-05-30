class WatchesController < ApplicationController
  def create
    current_user.watched(params[:movie_id], params[:movie_title], params[:movie_poster_path])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unwatch(params[:id])
    redirect_back(fallback_location: root_path)
  end
end
