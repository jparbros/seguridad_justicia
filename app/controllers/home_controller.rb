class HomeController < ApplicationController
  def show
    @banners = Banner.by_site(@site.id).active
    
    @representatives = Rails.cache.fetch("site-#{@site.id}-home-controller-representatives") {Representative.ready_to_home.by_site(@site.id).group_by {|representative| representative.position}}

    @seguimientos = Tracing.by_site(@site.id).most_recent

    @recent_questions = Question.to_home(@site.id)
    @recent_questions = @recent_questions.by_election(Election.active) if Election.active
    
    @best_questions = Question.with_anwser_by_site(@site.id).limit(3)
    @best_questions = @best_questions.by_election(Election.active) if Election.active
  end
end
