class Admin::TracingsController < Admin::BaseController

  before_filter :get_representative

  def index
    @tracings = @representative.tracings
  end

  def new
    @tracing = @representative.tracings.build
  end

  def create
    @tracing = @representative.tracings.new(params[:tracing])
    if @tracing.save
      redirect_to admin_representative_tracings_path(@representative)
    else
      render :new
    end
  end

  def edit
    @tracing = @representative.tracings.find params[:id]
  end

  def update
    @tracing = @representative.tracings.find params[:id]
    if @tracing.update_attributes(params[:tracing])
      redirect_to admin_representative_tracings_path(@representative)
    else
      render :new
    end
  end

  def destroy
    @tracing = @representative.tracings.find params[:id]
    @tracing.delete
    redirect_to admin_representative_tracings_path(@representative)
  end

  private

  def get_representative
    @representative = Representative.find(params[:representative_id])
  end
end
