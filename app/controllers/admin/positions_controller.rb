class Admin::PositionsController < Admin::BaseController
  def index
    @positions = Position.by_site(@site.id)
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(params[:position])
    @position.site = @site
    if @position.save
      redirect_to admin_positions_url
    else
      render :new
    end
  end

  def edit
    @position = Position.find params[:id]
  end

  def update
    @position = Position.find params[:id]
    if @position.update_attributes(params[:position])
      redirect_to admin_positions_url
    else
      render :new
    end
  end

  def destroy
    @position = Position.find params[:id]
    @position.delete
    redirect_to admin_positions_url
  end

end
