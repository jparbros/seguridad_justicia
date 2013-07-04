class Events::Post < ActiveRecord::Base
  self.table_name = 'events_posts'
  
  attr_accessible :body, :draft, :published_at, :title, :event_category_list
  
  belongs_to :site, class_name: 'Cms::Site'
  
  acts_as_taggable_on :event_categories
  
  def self.by_site(site_id)
    where(site_id: site_id)
  end
  
  def self.published
    where(draft: false)
  end
  
  def self.to_home(site_id)
    where(site_id: site_id).order('published_at DESC').limit(3)
  end
  
  def publish!
    self.draft = false
    self.published_at = Time.now
    save
  end
  
  def unpublish!
    self.draft = true
    save
  end
end
