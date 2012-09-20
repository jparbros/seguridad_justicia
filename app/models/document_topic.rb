class DocumentTopic < ActiveRecord::Base
  
  #
  # Accessors
  #
  attr_accessible :name, :site_id
  
  #
  # Associations
  #
  has_and_belongs_to_many :documents
  has_and_belongs_to_many :tracings, class_name: 'Document', conditions: {type: 'Tracing'}
  belongs_to :site, class_name: 'Cms::Site'
  
  def self.by_site(site_id)
    where(site_id: site_id)
  end
  
  def self.tokens(query)
    topics = where("name like ?", "%#{query}%")
    if topics.empty?
      [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    else
      topics
    end
  end
  
  def self.ids_from_tokens(tokens, site_id)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1, site_id: site_id).id }
    tokens.split(',')
  end
end
