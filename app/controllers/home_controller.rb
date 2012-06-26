class HomeController < ApplicationController
  def show
    @banners = Banner.by_site(@site.id).active
    @recent_questions = Question.to_home(@site.id)
    @best_questions = Question.best_by_site(@site.id)
  end
end
