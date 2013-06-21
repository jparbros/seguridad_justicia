require_dependency ComfortableMexicanSofa::Engine.root.join('app', 'controllers', 'cms_admin', 'sites_controller').to_s

class CmsAdmin::SitesController < CmsAdmin::BaseController

  def index
    return redirect_to :action => :new if Cms::Site.count == 0
    @sites = [current_admin.site]
  end

end
