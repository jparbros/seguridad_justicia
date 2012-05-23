class PreguntasController < ApplicationController

  def create
    @question = Question.new(params[:question])
    @question.site = @site
    unless @question.save
      flash[:error] = "No se pudo crear la pregunta, #{@question.errors.messages.values.join(',')}"
    end
    redirect_to root_url
  end

end