class CacheObserver < ActiveRecord::Observer
   observe :answer, :banner, :candidate, :election, :phrase, :question, :representative, :setting, :vote
   
   def after_save(object)
     # Rails.cache.clear
   end
end
