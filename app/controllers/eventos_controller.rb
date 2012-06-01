class EventosController < ApplicationController
  def index
    @events = Event.to_home(@site.id)

    respond_to do |format|
      format.html
      format.js { render json: @events.to_json }
    end
  end

  def show
    @evento = Event.find(params[:id])
  end
end
