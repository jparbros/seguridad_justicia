class DistritosController < ApplicationController
  def show
    @representatives = Representative
    District.find(params[:id]).sections.each do |section|
      @representatives =  Representative.by_site(@site.id).where("representatives.section LIKE ? ", "%#{params[:id]}%").group_by {|representative| representative.position}
    end
  end
  
  def busqueda
    redirect_to distrito_path(:id => params[:district_number])
  end
end
