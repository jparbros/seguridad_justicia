class DistritosController < ApplicationController
  def show
    @representatives = Representative.where(district: params[:id])
  end
  
  def busqueda
    redirect_to distrito_path(:id => params[:district_number])
  end
end
