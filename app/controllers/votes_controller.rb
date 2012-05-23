class VotesController < ApplicationController

  def create
    unless cookies["scg_pregunta_#{question.id}"]
      question.vote_up
      cookies["scg_pregunta_#{question.id}"] = true
    else
      flash[:error] = 'Ya haz votado esta pregunta.'
    end
    redirect_to :back
  end

  private

  def question
    @question ||= Question.find(params[:pregunta_id])
  end

end
