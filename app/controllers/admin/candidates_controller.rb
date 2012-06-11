class Admin::CandidatesController < Admin::BaseController
  def index
    @candidates = Candidate.by_site(@site.id)
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(params[:candidate])
    @candidate.site = @site
    if @candidate.save
      redirect_to admin_candidates_url
    else
      render :new
    end
  end

  def edit
    @candidate = Candidate.find params[:id]
  end

  def update
    @candidate = Candidate.find params[:id]
    if @candidate.update_attributes(params[:candidate])
      redirect_to admin_candidates_url
    else
      render :new
    end
  end

  def destroy
    @candidate = Candidate.find params[:id]
    @candidate.delete
    redirect_to admin_candidates_url
  end
end
