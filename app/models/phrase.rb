class Phrase < ActiveRecord::Base
  attr_accessible :phrase, :site_id

  validates :phrase, presence: true
  validate :allowed_words

  belongs_to :site, class_name: 'Cms::Site'

  def allowed_words
    not_allowed_words = Blacklist.all.collect {|word| word.word}
    phrase_in_words = (self.phrase.present?)? self.phrase.split(' ') : []
    not_allowed_words_in_phrase = not_allowed_words & phrase_in_words
    errors.add(:no_allowed_words, 'contiene palabras no permitidas') if not_allowed_words_in_phrase.size > 0
  end

  def uniqueness_by_site
    phrase = Phrase.where(site_id: self.site_id, phrase: self.phrase)
    errors.add(:uniqueness_by_site, 'frase ya existente') if phrase.present?
  end

  def self.by_site_to_cloud(site_id)
    phrases = where(site_id: site_id).group(:phrase).select('SUM(1) as weight, phrase').order('weight DESC').limit(50)
    phrases.collect {|phrase| {text: phrase.phrase, weight:  phrase.weight}}.to_json
  end
end
