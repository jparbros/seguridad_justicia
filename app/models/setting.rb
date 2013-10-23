class Setting < RailsSettings::CachedSettings
  attr_accessible :var
  
  after_save :clear_cache
  
  private
  
  def clear_cache
    Rails.cache.clear
  end
end
