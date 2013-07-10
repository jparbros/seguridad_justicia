class SeccionesController < ApplicationController
  
  def show
    @representatives =  Representative.by_site(@site.id).where("representatives.section LIKE ? ", "%#{params[:id]}%").group_by {|representative| representative.position}
  end
  
  def busqueda
    redirect_to seccione_path(:id => params[:section_number])
  end
end
