class Candidate < ActiveRecord::Base
  attr_accessible :image, :logo, :name, :political_party_id, :site_id, :election_id

  belongs_to :site, class_name: 'Cms::Site'
  has_many :answers
  has_many :questions, through: :answers
  belongs_to :political_party
  belongs_to :election

  default_scope order('political_parties.name ASC').includes(:political_party)
  
  after_save :clear_cache

  def self.by_site(site_id)
    where(site_id: site_id)
  end
  
  private
  
  def clear_cache
    Rails.cache.clear
  end
end
