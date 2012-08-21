class HomeController < ApplicationController
  def show
    @banners = Banner.by_site(@site.id).active
    @best_questions = Question.with_anwser_by_site(@site.id).limit(3)
  end
end
