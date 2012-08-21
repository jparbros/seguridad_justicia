class FrasesController < ApplicationController

  def index
    if request.xhr?
      @phrases = Phrase.by_site_to_cloud @site.id
    end

    respond_to do |format|
      format.html
      format.json { render :json => @phrases }
    end
  end

  def create
    @phrase = Phrase.new(params[:phrase])
    @phrase.site = @site
    unless @phrase.save
      flash[:error] = "No se pudo crear la frase, #{@phrase.errors.messages.values.join(',')}"
    end
    redirect_to opina_index_url
  end
end
