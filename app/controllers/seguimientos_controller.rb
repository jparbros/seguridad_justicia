class SeguimientosController < ApplicationController
  
  def index
    @seguimientos = Tracing.by_site(@site.id).most_recent
  end
  
  def show
    @seguimiento = Tracing.find(params[:id])
  end
  
end
