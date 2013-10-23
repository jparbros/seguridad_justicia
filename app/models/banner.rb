class Banner < ActiveRecord::Base
  attr_accessible :active, :position, :image, :site_id, :link

  mount_uploader :image, ImageUploader

  belongs_to :site, class_name: 'Cms::Site'

  validates :site_id, presence: true

  after_save :clear_cache

  def self.active
    where(active: true)
  end

  def self.by_site(site_id)
    where(site_id: site_id)
  end

  def link_to_banner
    if link.present?
      link.match('http://') ? link : 'http://' + link
    end
  end
  
  private
  def clear_cache
    Rails.cache.clear
  end
end
