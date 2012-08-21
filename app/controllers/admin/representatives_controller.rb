class Admin::RepresentativesController < Admin::BaseController
  def index
    @representatives = Representative.by_site(@site.id)
  end

  def new
    @representative = Representative.new
  end

  def create
    @representative = Representative.new(params[:representative])
    @representative.site = @site
    if @representative.save
      redirect_to admin_representatives_url
    else
      render :new
    end
  end

  def edit
    @representative = Representative.find params[:id]
  end

  def update
    @representative = Representative.find params[:id]
    if @representative.update_attributes(params[:representative])
      redirect_to admin_representatives_url
    else
      render :new
    end
  end

  def destroy
    @representative = Representative.find params[:id]
    @representative.delete
    redirect_to admin_representatives_url
  end

end
