class Answer < ActiveRecord::Base
  attr_accessible :candidate_id, :question_id, :url

  include Votes

  act_as_votes

  belongs_to :candidate
  belongs_to :question

  def url_for_youtube
    parsed_url = self.url.match(/v=.*/).to_s.gsub('v=','').gsub('&','')
    "http://www.youtube.com/embed/#{parsed_url}"
  end
end
