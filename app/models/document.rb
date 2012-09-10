class Document < ActiveRecord::Base
  
  #
  # Accessors
  #
  attr_accessible :content, :documentable_id, :documentable_type, :representative_id, :site_id, :title, :topic_tokens
  
  #
  # Associations
  #
  belongs_to :representative
  belongs_to :site
  belongs_to :representative
  has_and_belongs_to_many :document_topics
  
  #
  # Scopes
  #
  scope :most_recent, order('created_at desc').limit(5)
  
  #
  # Callback
  #
  after_initialize :parse_content
  
  serialize :topic_ids
  
  def self.by_site(site_id)
    where(site_id: site_id)
  end
  
  def topic_tokens=(tokens)
    self.topic_ids = document_topics.ids_from_tokens(tokens)
  end
  
  def topic_tokens
    self.topic_ids
  end
  
  def json_topics
    topic_ids.map {|id| DocumentTopic.find id}.to_json if topic_ids
  end
  
  def topics
    topic_ids.map {|id| DocumentTopic.find id} if topic_ids
  end
  
  def parse_content
    @content_parsed = Nokogiri::HTML(content)
  end

  def first_paragraph
    @content_parsed.css('p').first.to_s
  end
end
