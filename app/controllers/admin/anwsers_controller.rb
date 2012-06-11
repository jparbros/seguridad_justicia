class Admin::AnwsersController < Admin::BaseController

  before_filter :get_candidate

  def index
    @anwsers = @candidate.candidates_questions
  end

  def new
    @anwser = @candidate.candidates_questions.build
    @questions = Question.by_site(@site.id).collect {|question| [question.question, question.id]}
  end

  def create
    @anwser = @candidate.candidates_questions.new(params[:candidates_question])
    if @anwser.save
      redirect_to admin_candidate_anwsers_path(@candidate)
    else
      render :new
    end
  end

  def edit
    @anwser = @candidate.candidates_questions.find params[:id]
    @questions = Question.by_site(@site.id).collect {|question| [question.question, question.id]}
  end

  def update
    @anwser = @candidate.candidates_questions.find params[:id]
    if @anwser.update_attributes(params[:candidates_question])
      redirect_to admin_candidate_anwsers_path(@candidate)
    else
      render :new
    end
  end

  def destroy
    @anwser = @candidate.candidates_questions.find params[:id]
    @anwser.delete
    redirect_to admin_candidate_anwsers_path(@candidate)
  end

  private

  def get_candidate
    @candidate = Candidate.find(params[:candidate_id])
  end
end
