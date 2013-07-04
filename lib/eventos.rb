class Eventos

  attr_accessor :page, :site_id, :date, :category, :results

  def initialize(site_id, page, date, category)
    self.page = page || 1
    self.site_id = site_id
    self.date = date
    self.category = category
    self.results = []
    self.search_results
    self
  end

  def search_results
    self.by_site if self.date.nil? && self.category.nil?
    self.by_category if self.category.present?
    self.by_month if self.date.present?
    self.order_results
  end

  def by_site
    events = Event.by_site(self.site_id).page(self.page)
    posts = Events::Post.by_site(self.site_id).page(self.page)
    self.results = events + posts
  end
  
  def by_category
    events = Event.by_site(self.site_id).page(self.page).tagged_with(self.category)
    posts = Events::Post.by_site(self.site_id).page(self.page).tagged_with(self.category)
    self.results = events + posts
  end
  
  def by_month
    month = Time.parse("#{self.date}-01")
    events = Event.by_site(self.site_id).page(self.page).where(created_at: [month.beginning_of_month..month.end_of_month])
    posts = Events::Post.by_site(self.site_id).page(self.page).where(created_at: [month.beginning_of_month..month.end_of_month])
    self.results = events + posts
  end
  
  def self.all_grouped_by_month(site_id)
    events = Event.by_site(site_id)
    posts = Events::Post.by_site(site_id)
    results = events + posts
    results.group_by { |result| result.created_at.beginning_of_month }.sort.reverse
  end
  
  def self.count_by_tag_and_site(category, site_id)
    Event.tagged_with(category).by_site(site_id).count + Events::Post.tagged_with(category).by_site(site_id).count
  end
  
  def self.exist_in_tag_and_site(category, site_id)
    (Event.tagged_with(category).by_site(site_id) + Events::Post.tagged_with(category).by_site(site_id)).present?
  end
  
  def order_results
    self.results.sort_by! {|result| result.created_at}
  end
end