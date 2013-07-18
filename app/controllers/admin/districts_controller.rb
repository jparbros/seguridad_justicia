class Admin::DistrictsController < Admin::BaseController
  def index
    @districts = District.by_site(@site.id)
  end

  def new
    @district = District.new
  end
  
  def create
    @district = District.new(params[:district])
    @district.site = @site
    if @district.save
      redirect_to admin_districts_url
    else
      render :new
    end
    
  end

  def edit
    @district = District.find(params[:id])
  end
  
  def update
    @district = District.find params[:id]
    if @district.update_attributes(params[:district])
      redirect_to admin_districts_url
    else
      render :new
    end
  end
  
  def destroy
    @district = District.find params[:id]
    @district.delete
    redirect_to admin_districts_url
  end
end
