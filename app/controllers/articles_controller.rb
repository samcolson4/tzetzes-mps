class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:create, :update]
  respond_to :json

  def index
    @articles = Article.page(params[:page]).per(15)
    @newest = @articles.order(datetime: :desc)
    @oldest = @articles.order(datetime: :asc)
    @articles_length = Article.all.length
  end

  def create
    @mp = Mp.find(params[:mp_id])

    if params["mp_serial"] == @mp.mp_serial
      @article = @mp.articles.create(article_params)
    end

    if @article
      render json: {
        status: :created,
        article: @article
      }
    else 
      render json: {
        status: 500,
        errors: "Error adding to database."
      }
    end

  end

  def search
    t1 = Time.now
    if params[:search].blank?
      redirect_to "/about" and return
    else
      @search_param = params[:search]
      @parameter = params[:search].downcase
      @headline_results = Article.all.where("lower(headline) LIKE :search", search: "%#{@parameter}%").order(datetime: :desc).limit(1000)
      @article_text_results = Article.all.where("lower(article_text) LIKE :search", search: "%#{@parameter}%").order(datetime: :desc).limit(1000)
      @mp_results = Mp.all.where("lower(name) LIKE :search", search: "%#{@parameter}%").limit(1000)
      @constit_results = Mp.all.where("lower(constituency) LIKE :search", search: "%#{@parameter}%").limit(1000)

      @headline_page = @headline_results.page(params[:page]).per(5)
      @article_page = @article_text_results.page(params[:page]).per(10)
    end
    t2 = Time.now
    @time_delta = t2 - t1
  end

  def statistics
    @articles_length = Article.all.length
    @dogs = Article.all.where("lower(article_text) LIKE :search", search: "%dog%").length
    @cats = Article.all.where("lower(article_text) LIKE :search", search: "%cats%").length
    @hedgehogs = Article.all.where("lower(article_text) LIKE :search", search: "%hedgehog%").length

    @most_articles = Article.group(:mp_id).order('mp_id DESC').limit(1000).count(:mp_id)
    
    @seven_days = Article.where('created_at >= ?', 1.week.ago).count

    # Mp with most articles
    # Tory w/most
    # Labour w/most 
    # etc
  end

private
  def article_params
    params.permit(:headline, :datetime, :url, :tag, :article_text, :mp_id)
  end

end
