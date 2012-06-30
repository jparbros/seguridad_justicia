class EvaluaController < ApplicationController

  def index
    @best_questions = Question.by_site(@site.id)
  end
end
