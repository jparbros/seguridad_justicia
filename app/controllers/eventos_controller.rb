class EventosController < ApplicationController
  def index
    @events = Eventos.new(@site.id, params[:page], params[:fecha], params[:categoria])
    @events = @events.results

    @categories = ActsAsTaggableOn::Tag.where(taggings: {context: "event_categories"}).includes(:taggings).order('name ASC')

    respond_to do |format|
      format.html
      format.js { render json: Event.to_home(@site.id).order('date DESC').to_json }
    end
  end

  def show
    @evento = Event.find(params[:id])
  end
end
