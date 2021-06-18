class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def create
    @mp = Mp.find(params[:mp_id])

    if params["mp_serial"] == @mp.mp_serial
      @article = @mp.articles.create(article_params)
    else
      print("\nArticle not created: mp_serials did not match\n")
    end
  end

  def search
    if params[:search].blank?
      redirect_to "/" and return
    else
      @parameter = params[:search].downcase
      @results = Article.all.where("lower(headline) LIKE :search", search: "%#{@parameter}%")
    end
  end

private
  def article_params
    params.permit(:headline, :datetime, :url, :tag, :article_text, :mp_id, :article)
  end

end
