class Admin::ElectionsController < Admin::BaseController

  def index
    @elections = Election.by_site(@site.id)
  end

  def new
    @election = Election.new
  end
  
  def create
    @election = Election.new(params[:election])
    @election.site = @site
    if @election.save
      redirect_to admin_elections_url
    else
      render :new
    end
  end
  
  def edit
    @election = Election.find(params[:id])
  end
  
  def update
    @election = Election.find params[:id]
    if @election.update_attributes(params[:election])
      redirect_to admin_elections_url
    else
      render :edit
    end
  end

  def destroy
    @election = Election.find params[:id]
    @election.delete
    redirect_to admin_elections_url
  end
  
  def activate
    elections = Election.by_site(@site.id)
    elections.map &:deactivate
    Election.find(params[:id]).activate
    redirect_to admin_elections_url
  end
  
  def deactivate
    Election.find(params[:id]).deactivate
    redirect_to admin_elections_url
  end
  
end
