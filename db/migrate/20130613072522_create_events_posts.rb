class CreateEventsPosts < ActiveRecord::Migration
  def change
    create_table :events_posts do |t|
      t.string :title
      t.text :body
      t.boolean :draft
      t.datetime :published_at
      t.integer :site_id

      t.timestamps
    end
  end
end
