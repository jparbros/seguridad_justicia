class Admin::DebatesController < Admin::BaseController
  def index
    @debates = Debate.by_site(@site.id)
  end

  def new
    @debate = Debate.new
  end

  def edit
  end
end
