class Candidate < ActiveRecord::Base
  attr_accessible :image, :logo, :name, :political_party_id, :site_id

  belongs_to :site, class_name: 'Cms::Site'
  has_many :answers
  has_many :questions, through: :answers
  belongs_to :political_party


  def self.by_site(site_id)
    where(site_id: site_id)
  end
end
