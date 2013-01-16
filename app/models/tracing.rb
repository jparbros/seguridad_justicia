class Tracing < Document
  
  attr_accessor :document_kind_text
  
  attr_accessible :document_kind_text
  
  def self.document_types
    self.select('DISTINCT(document_kind)').map(&:document_kind).select {|document_kind| document_kind.present?}
  end
end