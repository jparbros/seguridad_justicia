class Admin::TopicsController < Admin::BaseController
  def index
     @topics = Topic.by_site(@site.id)
   end

   def new
     @topic = Topic.new
   end

   def create
     @topic = Topic.new(params[:topic])
     @topic.site_id = @site.id
     if @topic.save
       redirect_to admin_topics_url
     else
       flash[:error] = 'No se pudo crear el evento'
       render :new
     end
   end

   def show
     @topic = Topic.find(params[:id])
   end

   def edit
     @topic = Topic.find(params[:id])
   end

   def update
     @topic = Topic.find(params[:id])
     if @topic.update_attributes(params[:topic])
       redirect_to admin_topics_url
     else
       flash[:error] = 'No se pudo editar el evento'
       render :edit
     end
   end

   def destroy
     @topic = Topic.find(params[:id])
     @topic.delete
     redirect_to admin_topics_url
   end
end