class Admin::NewsController < Admin::BaseController
  def index
    @news = News.by_site(@site.id)
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(params[:news])
    @news.site_id = @site.id
    if @news.save
      redirect_to admin_news_index_url
    else
      flash[:error] = 'No se pudo crear el evento'
      render :new
    end
  end

  def show
    @news = News.find(params[:id])
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update_attributes(params[:news])
      redirect_to admin_news_index_url
    else
      flash[:error] = 'No se pudo editar el evento'
      render :edit
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.delete
    redirect_to admin_news_index_url
  end
  end
