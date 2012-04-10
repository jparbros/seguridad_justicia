class Admin::BlacklistsController < Admin::BaseController

  def index
    @blacklists = Blacklist.all
  end

  def new
    @blacklist = Blacklist.new
  end

  def create
    @blacklist = Blacklist.new(params[:blacklist])
    if @blacklist.save
      redirect_to admin_blacklists_url
    else
      flash[:error] = 'No se pudo crear la palabra bloqueada'
      render :new
    end
  end

  def edit
    @blacklist = Blacklist.find(params[:id])
  end

  def update
    @blacklist = Blacklist.find(params[:id])
    if @blacklist.update_attributes(params[:blacklist])
      redirect_to admin_blacklists_url
    else
      flash[:error] = 'No se pudo editar la palabra bloqueada'
      render :edit
    end
  end

  def destroy
    @blacklist = Blacklist.find(params[:id])
    @blacklist.delete
    redirect_to admin_blacklists_url
  end
end
