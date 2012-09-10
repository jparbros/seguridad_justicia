class HomeController < ApplicationController
  def show
    @banners = Banner.by_site(@site.id).active
    @representantes = Representative.by_site(@site.id)
    @postura = Stance.by_site(@site.id).most_recent.first
    @seguimiento = Tracing.by_site(@site.id).most_recent.first
  end
end
