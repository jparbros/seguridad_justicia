class Representative < ActiveRecord::Base
  
  #
  # Accessors
  #
  attr_accessible :avatar, :district, :email, :name, :phone, :position, :political_party_id, :comissions, :biography, :site_id, :twitter, :circumscription, :birthday, :substitute

  #
  # Associations
  #
  has_many :tracings
  has_many :stances
  belongs_to :site, class_name: 'Cms::Site'
  belongs_to :political_party

  #
  # Uploaders
  #
  mount_uploader :avatar, AvatarUploader

  def self.by_site(site_id)
    where(site_id: site_id)
  end
end
