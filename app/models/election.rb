class Election < ActiveRecord::Base
  attr_accessible :active, :name
  
  belongs_to :site, class_name: 'Cms::Site'
  has_many :anwsers
  has_many :candidates
  has_many :representatives
  
  default_scope order('created_at DESC')
  
  def self.active
    where(active: true, site_id: ::Cms::Site.site.id).first
  end
  
  def self.deactive
    where(active: false).order('name ASC')
  end

  def self.by_site(site_id)
    where(site_id: site_id)
  end
  
  def deactivate
    update_attribute :active, false
  end
  
  def activate
    update_attribute :active, true
  end
end
