class RepresentantesController < ApplicationController
  def show
    @representante = Representative.find(params[:id])
  end
end
