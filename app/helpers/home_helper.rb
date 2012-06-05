module HomeHelper

  def question_phrase
    if @site.hostname.match /nl/
      "#{@site.label} ser&iacute;a m&aacute;s justo y seguro si:"
    else
      "#{@site.label} ser&iacute;a m&aacute;s justa y segura si:"
    end
  end

  def parent_ids
    @site.pages.where(parent_id: nil).map &:id
  end

  def phase_one_available?
    if Rails.env.production?
      ENV['phase_one'] == 'true'
    else
      true
    end
  end

  def phase_two_available?
    if Rails.env.production?
      ENV['phase_two'] == 'true'
    else
      true
    end
  end

  def phase_three_available?
    if Rails.env.production?
      ENV['phase_three'] == 'true'
    else
      true
    end
  end
end
