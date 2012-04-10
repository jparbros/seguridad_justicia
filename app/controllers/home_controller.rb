class HomeController < ApplicationController
  def show
    @banners = Banner.by_site(@site.id)
  end
end
