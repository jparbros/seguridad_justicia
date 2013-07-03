class NoticiasController < ApplicationController
  def index
    @noticias = News.by_site(@site.id).order('date DESC').page(params[:page] || 1)
    @categories = ActsAsTaggableOn::Tag.where(taggings: {taggable_type: 'News', context: "news_categories"}).includes(:taggings)
  end

  def show
    @news = News.find params[:id]
  end
end
