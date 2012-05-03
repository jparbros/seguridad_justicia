module ApplicationHelper

  def twitter_account
    if @site.hostname.match /bc/
      'BCSegurayJusta'
    elsif @site.hostname.match /nl/
      'NLSeguroyJusto'
    elsif @site.hostname.match /ch/
      'CHSegurayJusta'
   end
  end
end
