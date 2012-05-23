module Votes
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def act_as_votes
      has_many :votes, :as => :voteable, :dependent => :destroy
    end

    def most_voted
      order('votes_count desc')
    end

  end

  def vote_up
    votes.create(tendency: 1)
  end

  def vote_down
    votes.create(tendency: -1)
  end
end