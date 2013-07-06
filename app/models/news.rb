class News < ActiveRecord::Base
  attr_accessible :content, :date, :site_id, :title, :news_category_list
  
  # acts_as_taggable_on :news_categories
  
  paginates_per 10

  def self.by_site(site_id)
    where(site_id: site_id)
  end
  
  def self.to_sidebar(site_id)
    by_site(site_id).limit(3).order('date DESC')
  end
end
