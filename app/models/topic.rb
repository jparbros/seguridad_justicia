class Topic < ActiveRecord::Base
  attr_accessible :name, :site_id

  belongs_to :site, class_name: 'Cms::Site'

  def self.by_site(site_id)
    where(site_id: site_id)
  end
end
