class DistritosController < ApplicationController
  def show
    @representatives = Representative
    district = District.find_by_district_number(params[:id])
    if district.present?
      district.sections.each do |section|
        @representatives =  Representative.by_site(@site.id).where("representatives.section LIKE ? ", "%#{params[:id]}%").group_by {|representative| representative.position}
      end 
    else
      @representatives = []
    end
  end
  
  def busqueda
    redirect_to distrito_path(:id => params[:district_number])
  end
end
