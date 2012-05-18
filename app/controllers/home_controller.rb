class HomeController < ApplicationController
  def show
    @banners = Banner.by_site(@site.id).active
    @events = Event.to_home(@site.id)
    @recent_questions = Question.all
  end
end
