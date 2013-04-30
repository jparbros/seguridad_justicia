class SeccionesController < ApplicationController
  
  def show
    @representatives = Representative.where(section: params[:id])
  end
  
  def busqueda
    redirect_to seccione_path(:id => params[:section_number])
  end
end
