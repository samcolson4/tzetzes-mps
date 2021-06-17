class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def create
    @mp = Mp.find(params[:mp_id])
    @article = @mp.articles.create(article_params)
  end

private
  def article_params
    params.permit(:headline, :datetime, :url, :tag, :article_text)
  end

end
