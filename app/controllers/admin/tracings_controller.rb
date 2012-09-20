class Admin::TracingsController < Admin::BaseController

  def index
    @tracings = Tracing.by_site @site.id
  end

  def new
    @tracing = Tracing.new
  end

  def create
    @tracing = Tracing.new(params[:tracing].merge({site_id: @site.id}))
    if @tracing.save
      redirect_to admin_tracings_path
    else
      render :new
    end
  end

  def edit
    @tracing = Tracing.find params[:id]
  end

  def update
    @tracing = Tracing.find params[:id]
    if @tracing.update_attributes(params[:tracing])
      redirect_to admin_tracings_path
    else
      render :new
    end
  end

  def destroy
    @tracing = Tracing.find params[:id]
    @tracing.delete
    redirect_to admin_tracings_path
  end

end
