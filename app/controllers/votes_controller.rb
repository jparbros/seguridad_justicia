class VotesController < ApplicationController

  def create
    cookie_votes_count = cookies['scj_votes'].to_i + 1
    if cookies["scg_pregunta_#{question.id}"].blank? and (cookie_votes_count <= 3)
      question.vote_up
      cookies["scg_pregunta_#{question.id}"] = true
      cookies['scj_votes'] = cookie_votes_count
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
