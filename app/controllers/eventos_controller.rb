class EventosController < ApplicationController
  def show
    @evento = Event.find(params[:id])
    @events = Event.to_home(@site.id)
  end
end
