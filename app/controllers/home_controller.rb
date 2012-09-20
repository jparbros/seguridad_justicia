class HomeController < ApplicationController
  def show
    @banners = Banner.by_site(@site.id).active
    @representantes = Representative.by_site(@site.id)
    @seguimientos = Tracing.by_site(@site.id).most_recent
  end
end
