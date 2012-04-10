class Admin::BaseController < CmsAdmin::BaseController

  before_filter :get_site

  def get_site
    @site = current_admin.site
  end
end
