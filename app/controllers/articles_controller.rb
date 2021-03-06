class ArticlesController < ApplicationController
  before_action :set_article, only:[:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end
  def new
    if logged_in?
      if params[:back]
        @article = Article.new(article_params)
      else
        @article = Article.new
      end
    else
      redirect_to new_session_path
    end
  end
  def create
    @article = current_user.articles.build(article_params)
    if params[:back]
      render :new
    else
      if @article.save
        redirect_to articles_path,notice: "投稿しました。"
      else
        render :new
      end
    end
  end
  def show
    if logged_in?
      @favorite = current_user.favorites.find_by(article_id: @article.id)
    else
      redirect_to new_session_path
    end
  end
  def edit
  end
  def update
    if @article.update(article_params)
      redirect_to articles_path, notice:"記事を編集しました。"
    else
      render :edit
    end
  end
  def destroy
    @article.destroy
    redirect_to articles_path, notice:"記事を削除しました。"
  end
  def confirm
    @article = current_user.articles.build(article_params)
    render :new if @article.invalid?
  end
  private
  def article_params
    params.require(:article).permit(:content, :image, :image_cache)
  end
  def set_article
    @article = Article.find(params[:id])
  end
end
