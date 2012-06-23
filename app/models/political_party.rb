class PoliticalParty < ActiveRecord::Base
  attr_accessible :initials, :logo, :name, :site_id, :visible

  belongs_to :site, class_name: 'Cms::Site'

  mount_uploader :logo, LogoUploader

  def self.by_site(site_id)
    where(site_id: site_id)
  end

  def self.visible_by_site(site_id)
    where(site_id: site_id, visible: true)
  end
end
