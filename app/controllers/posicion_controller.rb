class PosicionController < ApplicationController
  
  def index
    @representante = Representative.find(params[:representante_id])
    @posturas = @representante.stances.most_recent
  end
  
  def show
    @representante = Representative.find(params[:representante_id])
    @postura = @representante.stances.find(params[:id])
  end
end
