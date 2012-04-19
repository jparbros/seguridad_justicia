class Debate < ActiveRecord::Base
  attr_accessible :active, :site_id, :topic

  def self.by_site(site_id)
    where(site_id: site_id)
  end
end
