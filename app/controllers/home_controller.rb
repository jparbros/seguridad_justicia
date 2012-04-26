class HomeController < ApplicationController
  def show
    @banners = Banner.by_site(@site.id)
    @events = Event.to_home(@site.id)
  end
end
