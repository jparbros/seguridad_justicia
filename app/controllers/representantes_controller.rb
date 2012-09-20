class RepresentantesController < ApplicationController
  def show
    @representante = Representative.find(params[:id])
    @posturas = @representante.stances.by_site(@site.id).most_recent
    @seguimiento = @representante.tracings.by_site(@site.id).most_recent.first
  end
end
