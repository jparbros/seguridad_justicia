class HomeController < ApplicationController
  def show
    @banners = Banner.by_site(@site.id).active
    @recent_questions = Question.to_home(@site.id)
    @best_questions = Question.by_site(@site.id).limit(3)
  end
end
