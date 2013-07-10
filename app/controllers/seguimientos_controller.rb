class SeguimientosController < ApplicationController
  
  def index
    @seguimientos = Tracing.by_site(@site.id).most_recent.where(document_kind: params[:tipo]) if params[:tipo]
    if params[:tema]
      @topic = DocumentTopic.find(params[:tema])
      debugger
      @seguimientos = @topic.tracings.by_site(@site.id).most_recent
    end
    @seguimientos = Tracing.by_site(@site.id).most_recent if params[:tipo].blank? && params[:tema].blank?
  end
  
  def show
    @seguimiento = Tracing.find(params[:id])
  end
  
end
