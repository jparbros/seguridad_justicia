class Admin::BaseController < CmsAdmin::BaseController

  before_filter :get_site

  def get_site
    @site = current_admin.site
  end

  def admin_domain
    #redirect_to root_path unless request.subdomain == 'admin'
  end
end
