class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def create
    @mp = Mp.find(params[:mp_id])

    if params["mp_serial"] == @mp.mp_serial
      @article = @mp.articles.create(article_params)
    else
      print("\n")
      print("Article not created: mp_serials did not match")
      print("\n")
    end
  end

private
  def article_params
    params.permit(:headline, :datetime, :url, :tag, :article_text, :mp_id, :article)
  end

end
