class FavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    post = Post.find params[:post_id]
    favorite = post.favorites.new
    favorite.user = current_user
    if favorite.save
      redirect_to post, notice: "Post favorited."
    else
      redirect_to post, alert: "Could not favorite!"
    end
  end

  def destroy
    post = Post.find params[:post_id]
    favorite = current_user.favorites.find_by_post_id(post)
    favorite.destroy
    redirect_to post, notice: "Un-favorited"
  end

  def index
    @favorites = current_user.favorites
  end


end
