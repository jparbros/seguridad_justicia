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

  def facebook_link
    if @site.hostname.match /bc/
      'https://www.facebook.com/groups/seguridadconjusticiabc/'
    elsif @site.hostname.match /nl/
      'https://www.facebook.com/pages/Seguridad-con-Justicia-NL/419191424768202'
    elsif @site.hostname.match /ch/
      'https://www.facebook.com/SeguridadconJusticiaCH'
   end
  end

  def youtube_account
    if @site.hostname.match /bc/
      'BCSegurayJusta'
    elsif @site.hostname.match /nl/
      'NLSegurayJusta'
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
  
  def content_teaser(content)
    truncated_content = truncate(strip_tags(content), {
      :length => 200,
      :preserve_html_tags => false
    }).html_safe
  end
end
