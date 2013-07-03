class EvaluaController < ApplicationController

  def index
    @best_questions = Question.by_site(@site.id)

    if params[:eleccion]
      @best_questions = @best_questions.by_election(params[:eleccion])
    elsif Election.active
      @best_questions = @best_questions.by_election(Election.active)
    end
  end
end
