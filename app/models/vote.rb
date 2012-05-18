class Vote < ActiveRecord::Base
  attr_accessible :tendency, :votable_id, :votable_type
end
