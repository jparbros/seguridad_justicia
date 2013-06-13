class Events::PostsController < ApplicationController
  
  def index
    @events_posts = ::Events::Post.to_home(@site.id)

    respond_to do |format|
      format.html
      format.js { render json: @events_posts.to_json }
    end
  end
  
  def show
    @post = ::Events::Post.find(params[:id])
  end
end
