class Question < ActiveRecord::Base
  attr_accessible :question, :site_id

  belongs_to :site, class_name: 'Cms::Site'
  has_many :votes
end
