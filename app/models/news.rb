class News < ActiveRecord::Base
  attr_accessible :content, :date, :site_id, :title, :news_category_list
  
  acts_as_taggable_on :news_categories
  
  paginates_per 20

  def self.by_site(site_id)
    where(site_id: site_id)
  end
  
  def self.to_sidebar(site_id)
    by_site(site_id).limit(3).order('date DESC')
  end
  
  def self.news_grouped_by_month_and_site(site_id)
    @noticias_por_mes ||= self.by_site(site_id).group_by { |t| t.created_at.beginning_of_month }.sort.reverse
  end
  
  def self.count_by_tag_and_site(tag, site_id)
    self.tagged_with(tag).by_site(site_id).count
  end
  
  def self.exist_in_tag_and_site(tag, site_id)
    self.tagged_with(tag).by_site(site_id).present?
  end
  
  def self.by_month(date)
    month = Time.parse("#{date}-01")
    self.where(created_at: [month.beginning_of_month..month.end_of_month])
  end
end
