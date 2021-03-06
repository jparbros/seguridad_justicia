class PreguntasController < ApplicationController

  def create
    @question = Question.new(params[:question])
    @question.site = @site
    @question.election = Election.active if Election.active
    unless @question.save
      flash[:error] = "No se pudo crear la pregunta, #{@question.errors.messages.values.join(',')}"
    end
    redirect_to pregunta_url
  end

  def index
    @events = Event.to_home(@site.id)
    
    @questions = Question.most_voted(@site.id)
    if params[:eleccion]
      @questions = @questions.by_election(params[:eleccion]) 
    elsif Election.active
      @questions = @questions.by_election(Election.active)
    end
  end

end