class PosturasController < ApplicationController

  def index
    @topics = Topic.by_site(@site.id)
    @topics_seguridad = Topic.seguridad_by_site(@site.id)
    @topics_justicia = Topic.justicia_by_site(@site.id)
    @political_parties = PoliticalParty.by_site(@site.id)
    @events = Event.to_home(@site.id)
  end


end
