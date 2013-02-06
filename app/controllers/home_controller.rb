class HomeController < ApplicationController
  def show
    @banners = Banner.by_site(@site.id).active
    @diputados_federales = Representative.by_site(@site.id).where(position: 'diputado_federal')
    @senadores = Representative.by_site(@site.id).where(position: 'senador')
    @alcaldes = Representative.by_site(@site.id).where(position: 'presidente_municipal')
    @diputados_locales = Representative.by_site(@site.id).where(position: 'diputado_local')
    @seguimientos = Tracing.by_site(@site.id).most_recent
    @recent_questions = Question.to_home(@site.id)
    @best_questions = Question.with_anwser_by_site(@site.id).limit(3)
  end
end
