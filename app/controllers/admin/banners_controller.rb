class Admin::BannersController < Admin::BaseController
  def index
    @banners = Banner.by_site(@site.id)
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(params[:banner])
    @banner.site = @site
    if @banner.save
      redirect_to admin_banners_url
    else
      render :new
    end
  end

  def edit
    @banner = Banner.find params[:id]
  end

  def update
    @banner = Banner.find params[:id]
    if @banner.update_attributes(params[:banner])
      redirect_to admin_banners_url
    else
      render :new
    end
  end

  def destroy
    @banner = Banner.find params[:id]
    @banner.delete
    redirect_to admin_banners_url
  end

end
