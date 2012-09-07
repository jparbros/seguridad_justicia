class Admin::StancesController < Admin::BaseController

  before_filter :get_representative

  def index
    @stances = @representative.stances
  end

  def new
    @stance = @representative.stances.build
  end

  def create
    @stance = @representative.stances.new(params[:stance])
    if @stance.save
      redirect_to admin_representative_stances_path(@representative)
    else
      render :new
    end
  end

  def edit
    @stance = @representative.stances.find params[:id]
  end

  def update
    @stance = @representative.stances.find params[:id]
    if @stance.update_attributes(params[:stance])
      redirect_to admin_representative_stances_path(@representative)
    else
      render :new
    end
  end

  def destroy
    @stance = @representative.stances.find params[:id]
    @stance.delete
    redirect_to admin_representative_stances_path(@representative)
  end

  private

  def get_representative
    @representative = Representative.find(params[:representative_id])
  end
end
