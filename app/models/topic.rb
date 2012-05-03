class Topic < ActiveRecord::Base
  attr_accessible :name, :site_id

  belongs_to :site, class_name: 'Cms::Site'
  has_many :positions

  def self.by_site(site_id)
    where(site_id: site_id)
  end

  def self.seguridad_by_site(site_id)
    where(site_id: site_id, kind: :seguridad)
  end

  def self.justicia_by_site(site_id)
    where(site_id: site_id, kind: :justicia)
  end
end
