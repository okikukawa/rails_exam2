class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(article_id: params[:article_id])
    redirect_to articles_url, notice: "#{favorite.article.user.name}さんの記事をお気に入りしました。"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to articles_url,notice: "#{favorite.article.user.name}さんの記事のお気に入りを解除しました。"
  end
end
