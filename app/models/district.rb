class District < ActiveRecord::Base
  
  #
  # Accessors
  #
  attr_accessible :district_number, :sections, :site_id, :section_ids
  
  #
  # Associations
  #
  belongs_to :site, class_name: 'Cms::Site'
  
  #
  # Serializers
  #
  serialize :sections
  
  def self.by_site(site_id)
    where(site_id: site_id)
  end
  
  def section_ids=(sections_ids)
    self.sections = sections_ids.split(',')
  end
  
  def section_ids
    self.sections.join(',') if self.sections.present?
  end
end
