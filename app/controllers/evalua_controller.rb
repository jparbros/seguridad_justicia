class EvaluaController < ApplicationController

  def index
    @best_questions = Question.by_site(@site.id)
    @best_questions = @best_questions.by_election(Election.active) if Election.active
  end
end
