class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_site

  def find_site
    @site ||= if params[:site_id]
          Cms::Site.find_by_id(params[:site_id])
        else
          Cms::Site.find_site(request.host.downcase, request.fullpath) || Cms::Site.first
        end
  end
end
