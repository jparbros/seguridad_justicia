class Admin::DocumentTopicsController < Admin::BaseController
  def index
    @topics = DocumentTopic.by_site(@site.id).order(:name)
    respond_to do |format|
      format.json{ render json: @topics.tokens(params[:q])}
    end
  end
end