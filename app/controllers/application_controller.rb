class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_site, :redirect_admin_domain

  def find_site
    @site ||= if params[:site_id]
          Cms::Site.find_by_id(params[:site_id])
        else
          Cms::Site.find_site(request.host.downcase, request.fullpath) || Cms::Site.last
        end
    Cms::Site.site = @site
  end

  def redirect_admin_domain
    #redirect_to admin_root_path if request.subdomain == 'admin' and !params[:controller].match(/admin/)
  end
end
