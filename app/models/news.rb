class News < ActiveRecord::Base
  attr_accessible :content, :date, :site_id, :title, :topic

  def self.by_site(site_id)
    where(site_id: site_id)
  end
end