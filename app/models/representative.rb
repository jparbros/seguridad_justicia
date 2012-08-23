class Representative < ActiveRecord::Base
  belongs_to :political_party

  attr_accessible :avatar, :district, :email, :name, :phone, :position, :political_party_id, :comissions, :biography, :site_id, :twitter

  belongs_to :site, class_name: 'Cms::Site'

  mount_uploader :avatar, AvatarUploader

  def self.by_site(site_id)
    where(site_id: site_id)
  end
end
