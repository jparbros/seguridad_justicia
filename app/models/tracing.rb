class Tracing < Document
  
  attr_accessor :document_kind_text
  
  attr_accessible :document_kind_text
  
  #
  # Scopes
  #
  scope :most_recent, order('published_at desc').limit(5)
  
  def self.document_types
    self.select('DISTINCT(document_kind)').map(&:document_kind).select {|document_kind| document_kind.present?}
  end
end