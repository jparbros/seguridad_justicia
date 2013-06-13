class HomeController < ApplicationController
  def show
    @banners = Banner.by_site(@site.id).active
    @diputados_federales = Representative.by_site(@site.id).where(position: 'diputado_federal')
    @diputados_federales = @diputados_federales.by_election(Election.active) if Election.active
    
    @senadores = Representative.by_site(@site.id).where(position: 'senador')
    @senadores = @senadores.by_election(Election.active) if Election.active
    
    @alcaldes = Representative.by_site(@site.id).where(position: 'presidente_municipal')
    @alcaldes = @alcaldes.by_election(Election.active) if Election.active
    
    @diputados_locales = Representative.by_site(@site.id).where(position: 'diputado_local')
    @diputados_locales = @diputados_locales.by_election(Election.active) if Election.active
    
    @seguimientos = Tracing.by_site(@site.id).most_recent

    @recent_questions = Question.to_home(@site.id)
    @recent_questions = @recent_questions.by_election(Election.active) if Election.active
    
    @best_questions = Question.with_anwser_by_site(@site.id).limit(3)
    @best_questions = @best_questions.by_election(Election.active) if Election.active
    
    @events_posts = ::Events::Post.by_site(@site.id).published.limit(3)
  end
end
