class PosturasController < ApplicationController

  def index
    @topics = Topic.by_site(@site.id)
    @political_parties = PoliticalParty.by_site(@site.id)
  end


end
