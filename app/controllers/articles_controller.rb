class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.page(params[:page]).per(15)
    @newest = @articles.order(datetime: :desc)
    @oldest = @articles.order(datetime: :asc)
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
      @headline_results = Article.all.where("lower(headline) LIKE :search", search: "%#{@parameter}%")
      @article_text_results = Article.all.where("lower(article_text) LIKE :search", search: "%#{@parameter}%")
      @mp_results = Mp.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
      @constit_results = Mp.all.where("lower(constituency) LIKE :search", search: "%#{@parameter}%")
    end
  end

private
  def article_params
    params.permit(:headline, :datetime, :url, :tag, :article_text, :mp_id, :article)
  end

end
