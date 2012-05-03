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

  def ga_code
    if @site.hostname.match /bc/
      'UA-31401146-1'
    elsif @site.hostname.match /nl/
      'UA-31401146-2'
    elsif @site.hostname.match /ch/
      'UA-31401146-3'
   end
  end
end
