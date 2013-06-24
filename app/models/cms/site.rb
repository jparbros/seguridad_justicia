require_dependency ComfortableMexicanSofa::Engine.root.join('app', 'models', 'cms', 'site').to_s

class Cms::Site < ActiveRecord::Base
  include RailsSettings::Extend
  
  has_many :elections
  
  cattr_accessor :site

end