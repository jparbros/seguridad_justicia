class CmsAdmin::SitesController < CmsAdmin::BaseController

  def index
    return redirect_to :action => :new if Cms::Site.count == 0
    @sites = [current_admin.site]
  end

end
