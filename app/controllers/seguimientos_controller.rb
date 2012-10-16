class SeguimientosController < ApplicationController
  
  def index
    if params[:tipo]
      @seguimientos = Tracing.by_site(@site.id).most_recent.where(document_kind: params[:tipo])
    else
      @seguimientos = Tracing.by_site(@site.id).most_recent
    end
  end
  
  def show
    @seguimiento = Tracing.find(params[:id])
  end
  
end
