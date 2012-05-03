class ProyectosController < ApplicationController
  def show

  end

  def index
    @events = Event.to_home(@site.id)
  end
end
