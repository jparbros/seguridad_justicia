class Representative < ActiveRecord::Base
  
  #
  # Accessors
  #
  attr_accessible :avatar, :district, :email, :name, :phone, :position, :political_party_id, :comissions, 
    :biography, :site_id, :twitter, :circumscription, :birthday, :substitute, :gender, :section, :representation_type, :facebook, :office

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
  
  #
  # Constants
  #
  
  def self.by_site(site_id)
    where(site_id: site_id)
  end
  
  def twitter_username
    twitter.strip.gsub('@','')
  end
  
  def position_parsed
    if gender == 'f'
      case position
      when 'diputado_local'
        'diputada_local'
      when 'diputado_federal'
        'diputada_federal'
      when 'senador'
        'senadora'
      when 'presidente_municipal'
        'presidenta_municipal'
      end
    else
      position
    end
  end
  
  def split_commisions
    divided_commission = comissions.split(',')
    divided_commission = comissions.split(';') if divided_commission.size <= 1
    divided_commission
  end
end
