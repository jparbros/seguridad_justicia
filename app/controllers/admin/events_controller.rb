class Admin::EventsController < Admin::BaseController
  def index
    @events = Event.by_site(@site.id)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    @event.site_id = @site.id
    if @event.save
      redirect_to admin_events_url
    else
      flash[:error] = 'No se pudo crear el evento'
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to admin_events_url
    else
      flash[:error] = 'No se pudo editar el evento'
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.delete
    redirect_to admin_events_url
  end
end
