class Admin::Events::PostsController < Admin::BaseController
  
  def index
    @posts = ::Events::Post.by_site(@site.id)
  end
  
  def new
    @post = ::Events::Post.new
  end
  
  def create
    @post = ::Events::Post.new(params[:events_post])
    @post.site = @site
    @post.draft = true
    if @post.save
      redirect_to admin_events_posts_url, notice: 'Entrada creada correctamente.'
    else
      render :new
    end
  end
  
  def edit
    @post = ::Events::Post.find(params[:id])
  end
  
  def update
    @post = ::Events::Post.find(params[:id])
    if @post.update_attributes(params[:events_post])
      redirect_to admin_events_posts_url, notice: 'Entrada actualizada correctamente.'
    else
      render :edit
    end
  end
  
  def destroy
    @post = ::Events::Post.find(params[:id])
    @post.delete
    redirect_to admin_events_posts_url, notice: 'Entrada eliminada correctamente.'
  end
  
  def publish
    @post = ::Events::Post.find(params[:id])
    @post.publish!
    redirect_to admin_events_posts_url, notice: 'Entrada publicada.'
  end
  
  def unpublish
    @post = ::Events::Post.find(params[:id])
    @post.unpublish!
    redirect_to admin_events_posts_url, notice: 'Entrada desactivada.'
  end
end
