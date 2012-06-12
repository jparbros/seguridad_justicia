class Admin::AnwsersController < Admin::BaseController

  before_filter :get_candidate

  def index
    @anwsers = @candidate.answers
  end

  def new
    @anwser = @candidate.answers.build
    @questions = Question.by_site(@site.id).collect {|question| [question.question, question.id]}
  end

  def create
    @anwser = @candidate.answers.new(params[:answer])
    if @anwser.save
      redirect_to admin_candidate_anwsers_path(@candidate)
    else
      render :new
    end
  end

  def edit
    @anwser = @candidate.answers.find params[:id]
    @questions = Question.by_site(@site.id).collect {|question| [question.question, question.id]}
  end

  def update
    @anwser = @candidate.answers.find params[:id]
    if @anwser.update_attributes(params[:answer])
      redirect_to admin_candidate_anwsers_path(@candidate)
    else
      render :new
    end
  end

  def destroy
    @anwser = @candidate.answers.find params[:id]
    @anwser.delete
    redirect_to admin_candidate_anwsers_path(@candidate)
  end

  private

  def get_candidate
    @candidate = Candidate.find(params[:candidate_id])
  end
end
