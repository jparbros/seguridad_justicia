class CandidatesQuestion < ActiveRecord::Base

  belongs_to :candidate
  belongs_to :question

  def url_for_youtube
    parsed_url = self.answer_url.match(/v=.*&/).to_s.gsub('v=','').gsub('&','')
    "http://www.youtube.com/embed/#{parsed_url}"

  end
end