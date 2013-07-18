class Position < ActiveRecord::Base

  attr_accessible :content, :political_party_id, :topic_id, :site_id, :election_id

  belongs_to :site, class_name: 'Cms::Site'
  belongs_to :topic
  belongs_to :political_party
  belongs_to :election

  delegate :name, to: :political_party, prefix: true
  delegate :name, to: :topic, prefix: true

  def self.by_site(site_id)
    where(site_id: site_id)
  end

  def self.by_topic_and_political_party(topic_id, political_party_id)
    where(topic_id: topic_id, political_party_id: political_party_id)
  end

end
