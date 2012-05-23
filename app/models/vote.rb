class Vote < ActiveRecord::Base
  attr_accessible :tendency, :votable_id, :votable_type

  belongs_to :voteable, :polymorphic => true, :counter_cache => true
end
