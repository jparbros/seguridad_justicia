class Admin::QuestionsController < Admin::BaseController
  def index
    @questions = Question.by_site(@site.id)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.site_id = @site.id
    if @question.save
      redirect_to admin_questions_url
    else
      flash[:error] = 'No se pudo crear el Questiono'
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      redirect_to admin_questions_url
    else
      flash[:error] = 'No se pudo editar la Pregunta'
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.delete
    redirect_to admin_questions_url
  end
end
