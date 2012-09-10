class RepresentantesController < ApplicationController
  def show
    @representante = Representative.find(params[:id])
    @postura = @representante.stances.by_site(@site.id).most_recent.first
    @seguimiento = @representante.tracings.by_site(@site.id).most_recent.first
  end
end
