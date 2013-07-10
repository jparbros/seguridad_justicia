class AddPublishedAtToTracings < ActiveRecord::Migration
  def change
    add_column :documents, :published_at, :datetime
    Document.all.each do |document|
      document.published_at = document.created_at
      document.save
    end
  end
end
