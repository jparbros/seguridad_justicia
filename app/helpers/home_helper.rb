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
end
