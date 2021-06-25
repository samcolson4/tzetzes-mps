class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:create, :update]

  def index
    @articles = Article.page(params[:page]).per(15)
    @newest = @articles.order(datetime: :desc)
    @oldest = @articles.order(datetime: :asc)
  end

  def create
    @mp = Mp.find(params[:mp_id])

    if params["mp_serial"] == @mp.mp_serial
      @article = @mp.articles.create(article_params)
    end
  end

  def search
    t1 = Time.now
    if params[:search].blank?
      redirect_to "/about" and return
    else
      @parameter = params[:search].downcase
      @headline_results = Article.all.where("lower(headline) LIKE :search", search: "%#{@parameter}%").order(datetime: :desc)
      @article_text_results = Article.all.where("lower(article_text) LIKE :search", search: "%#{@parameter}%").order(datetime: :desc)
      @mp_results = Mp.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
      @constit_results = Mp.all.where("lower(constituency) LIKE :search", search: "%#{@parameter}%")
    end
    t2 = Time.now
    @time_delta = t2 - t1
  end

private
  def article_params
    params.permit(:headline, :datetime, :url, :tag, :article_text, :mp_id)
  end

end
