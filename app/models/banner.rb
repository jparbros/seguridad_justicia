class Banner < ActiveRecord::Base
  attr_accessible :active, :position, :image, :site_id

  mount_uploader :image, ImageUploader

  belongs_to :site, class_name: 'Cms::Site'

  validates :site_id, presence: true

  def self.by_site(site_id)
    where(site_id: site_id)
  end
end
