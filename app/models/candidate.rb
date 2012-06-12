class Candidate < ActiveRecord::Base
  attr_accessible :image, :logo, :name, :political_party, :site_id

  belongs_to :site, class_name: 'Cms::Site'
  has_many :answers
  has_many :questions, through: :answers


  def self.by_site(site_id)
    where(site_id: site_id)
  end
end
