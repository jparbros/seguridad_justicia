class Phrase < ActiveRecord::Base
  attr_accessible :phrase, :site_id

  validates :phrase, presence: true, uniqueness: true
  validate :allowed_words

  belongs_to :site, class_name: 'Cms::Site'

  def allowed_words
    not_allowed_words = Blacklist.all.collect {|word| word.word}
    phrase_in_words = (self.phrase.present?)? self.phrase.split(' ') : []
    not_allowed_words_in_phrase = not_allowed_words & phrase_in_words
    errors.add(:no_allowed_words, 'contiene palabras no permitidas') if not_allowed_words_in_phrase.size > 0
  end

  def self.by_site_to_cloud(site_id)
    phrases = where(site_id: site_id).order('created_at DESC').limit(50)
    phrases.collect {|phrase| {text: phrase.phrase, weight:  phrase.id}}.to_json
  end
end
