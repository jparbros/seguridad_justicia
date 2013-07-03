class NoticiasController < ApplicationController
  def index
    @noticias = News.by_site(@site.id).order('date DESC').page(params[:page] || 1)
    @noticias = @noticias.tagged_with(params[:categoria]) if params[:categoria]
    @noticias = @noticias.by_month(params[:fecha]) if params[:fecha]
    @categories = ActsAsTaggableOn::Tag.where(taggings: {taggable_type: 'News', context: "news_categories"}).includes(:taggings).order('name ASC')
  end

  def show
    @news = News.find params[:id]
  end
end
