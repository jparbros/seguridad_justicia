class SeguimientosController < ApplicationController
  
  def index
    @representante = Representative.find(params[:representante_id])
    @seguimientos = @representante.tracings.most_recent
  end
  
  def show
    @representante = Representative.find(params[:representante_id])
    @seguimiento = @representante.tracings.find(params[:id])
  end
  
end
