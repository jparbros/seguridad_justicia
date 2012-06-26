class RespuestasVotesController < ApplicationController

  def create
    if cookies["scg_respuesta_pregunta_#{answer.question.id}"].blank?
      answer.vote_up
      cookies["scg_respuesta_pregunta_#{answer.question.id}"] = true
    end
    redirect_to :back
  end

  private

  def answer
    @answer ||= Answer.find(params[:respuesta_id])
  end
end
