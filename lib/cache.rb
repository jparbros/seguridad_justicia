class Cache
  
  def self.caching(key, options=nil, &block)
    if Rails.cache.exist? key
      if block_given?
        Rails.logger.info("querying cache for [#{key}]")
        Rails.cache.fetch(key, options, &block)
      else
        Rails.cache.read(key)
      end
    else
      Rails.cache.write(key, yield, options) if block_given?
    end
  end
  
  def self.delete(key)
    Rails.cache.delete(key)
  end
end