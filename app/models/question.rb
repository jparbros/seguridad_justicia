class Question < ActiveRecord::Base
  include Votes

  act_as_votes

  attr_accessible :question, :site_id

  belongs_to :site, class_name: 'Cms::Site'

  validate :allowed_words, :uniqueness_by_site

  validates :question, length: { maximum: 250 , :too_long => " solo se permiten %{count} caracteres." }

  def allowed_words
    not_allowed_words = Blacklist.all.collect {|word| word.word}
    question_in_words = (self.question.present?)? self.question.split(' ') : []
    not_allowed_words_in_question = not_allowed_words & question_in_words
    errors.add(:no_allowed_words, 'contiene palabras no permitidas') if not_allowed_words_in_question.size > 0
  end

  def uniqueness_by_site
    question_ = Question.where(site_id: self.site_id, question: self.question)
    errors.add(:uniqueness_by_site, 'Tu pregunta ya fue formulada. Puedes votar por ella en la lista de preguntas.') if question_.present?
  end

  def self.by_site(site_id)
    where(site_id: site_id)
  end

  def self.to_home(site_id)
    where(site_id: site_id).order('id desc').limit(6)
  end

  def self.most_voted(site_id)
    where(site_id: site_id).order('votes_count desc')
  end
end
