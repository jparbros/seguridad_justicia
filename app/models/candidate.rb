class Candidate < ActiveRecord::Base
  attr_accessible :image, :logo, :name, :political_party, :site_id

  belongs_to :site, class_name: 'Cms::Site'
  has_many :candidates_questions
  has_and_belongs_to_many :questions


  def self.by_site(site_id)
    where(site_id: site_id)
  end
end
