class Event < ActiveRecord::Base
  attr_accessible :date, :description, :title, :venue, :site_id
  
  include GoogleMaps

  def self.by_site(site_id)
    where(site_id: site_id)
  end

  def self.to_home(site_id)
    where(site_id: site_id).order('date DESC').limit(3)
  end
end
