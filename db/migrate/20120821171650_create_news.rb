class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :topic
      t.datetime :date
      t.text :content
      t.integer :site_id

      t.timestamps
    end
  end
end
