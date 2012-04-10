class Blacklist < ActiveRecord::Base
  attr_accessible :word

  validates :word, presence: true, uniqueness: true
end
