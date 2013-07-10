class HomeController < ApplicationController
  def show
    @banners = Banner.by_site(@site.id).active
    
    @representatives = Representative.by_site(@site.id).group_by {|representative| representative.position}
    
    # @diputados_federales = Representative.by_site(@site.id).where(position: 'diputado_federal')
    # 
    # @senadores = Representative.by_site(@site.id).where(position: 'senador')
    # 
    # @alcaldes = Representative.by_site(@site.id).where(position: 'presidente_municipal')
    # 
    # @diputados_locales = Representative.by_site(@site.id).where(position: 'diputado_local')
    
    @seguimientos = Tracing.by_site(@site.id).most_recent

    @recent_questions = Question.to_home(@site.id)
    @recent_questions = @recent_questions.by_election(Election.active) if Election.active
    
    @best_questions = Question.with_anwser_by_site(@site.id).limit(3)
    @best_questions = @best_questions.by_election(Election.active) if Election.active
    
    @events_posts = ::Events::Post.by_site(@site.id).published.limit(3)
  end
end
