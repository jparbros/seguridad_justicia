class Admin::PoliticalPartiesController < Admin::BaseController
  def index
     @political_parties = PoliticalParty.by_site(@site.id)
   end

   def new
     @political_party = PoliticalParty.new
   end

   def create
     @political_party = PoliticalParty.new(params[:political_party])
     @political_party.site = @site
     if @political_party.save
       redirect_to admin_political_parties_url
     else
       render :new
     end
   end

   def edit
     @political_party = PoliticalParty.find params[:id]
   end

   def update
     @political_party = PoliticalParty.find params[:id]
     if @political_party.update_attributes(params[:political_party])
       redirect_to admin_political_parties_url
     else
       render :new
     end
   end

   def destroy
     @political_party = PoliticalParty.find params[:id]
     @political_party.delete
     redirect_to admin_political_parties_url
   end

end
